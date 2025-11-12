resource "aws_codepipeline" "terraform_pipeline" {
  name     = "sagemaker-terraform-pipeline"
  role_arn = module.iam_role.codepipeline_role_arn

  artifact_store {
    location = module.s3_artifact_bucket.artifact_bucket_name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "GitHub_Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.github_connection.arn
        FullRepositoryId = "${var.github_owner}/${var.github_repo}"
        BranchName       = var.github_branch
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Deploy"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = aws_codebuild_project.terraform_build.name
      }
    }
  }
}

resource "aws_codebuild_project" "terraform_build" {
  name         = "terraform-deploy"
  service_role = module.iam_role.codebuild_role_arn
  artifacts {
    type = "CODEPIPELINE"
  }
  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:6.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }
  source {
    type      = "CODEPIPELINE"
    buildspec = file("buildspec.yml")
  }
}

data "aws_secretsmanager_secret_version" "github_token" {
  secret_id = var.github_token_secret_name
}

resource "aws_codestarconnections_connection" "github_connection" {
  name          = "github-connection-${var.environment}"
  provider_type = "GitHub"
  tags = {
    Environment = var.environment
  }
}

# Output the connection ARN to use in CodePipeline
output "codestar_connection_arn" {
  value = aws_codestarconnections_connection.github_connection.arn
}
