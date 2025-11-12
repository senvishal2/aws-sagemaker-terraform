provider "aws" {
  region = var.region
}

resource "aws_sagemaker_processing_job" "sample" {
  name     = "pipeline-${var.environment}-${var.region}"
  role_arn = var.role_arn

  processing_resources {
    cluster_config {
      instance_count     = 1
      instance_type      = "ml.t2.medium"
      volume_size_in_gb  = 5
    }
  }

  app_specification {
    image_uri = "382416733822.dkr.ecr.${var.region}.amazonaws.com/sklearn-processing:latest"
  }
}

output "processing_job_name" { value = aws_sagemaker_processing_job.sample.name }
