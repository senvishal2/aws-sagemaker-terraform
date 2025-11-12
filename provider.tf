# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 5.0"
#     }
#   }

#   backend "s3" {
#     bucket         =  "tf-backend-us-east-1-aaec78ed"
#     key            = "global/terraform.tfstate"
#     region         = "us-east-1"
#     # dynamodb_table = "terraform-lock"
#     encrypt        = true
#   }
# }

provider "aws" {
  region  = var.region
  profile = "default"
}
