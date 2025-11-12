variable "region" {
  type    = string
  default = "us-east-1"
}

variable "github_owner" {
  type    = string
  default = "senvishal2"
}

variable "github_repo" {
  type    = string
  default = "aws-sagemaker-terraform"
}

variable "github_branch" {
  type    = string
  default = "main"
}

variable "github_token_secret_name" {
  type    = string
  default = "github-token"
}

variable "account_id" {
  type    = string
  default = "123456789012" # Update to your AWS account ID
}

variable "artifact_bucket" {
  type    = string
  default = "sagemaker-terraform-artifacts-123456789012"
}
variable "environment" {
  type    = string
  default = "dev" # default environment
}

variable "s3_bucket_region" {
  type    = string
  default = "us-east-1"

}

# variable "codestar_connection_name" {
#   description = "Name of the AWS CodeStar connection"
#   type        = string
# }

# variable "backend_bucket" {
#   description = "S3 bucket name for Terraform backend"
#   type        = string
# }
