locals {
  regions_by_env = read_terragrunt_config(find_in_parent_folders("env-config.hcl")).locals.regions_by_env

  common_tags = {
    project     = "aws-sagemaker-terraform"
    managed_by  = "terragrunt"
  }
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-backend-bucket"    # replace or link with module output
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

inputs = {
  tags = local.common_tags
}