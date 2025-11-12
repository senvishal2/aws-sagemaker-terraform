variable "environment" {}
variable "region" {}
variable "role_arn" {}
variable "model_image" { default = "382416733822.dkr.ecr.us-east-1.amazonaws.com/linear-learner:latest" }
variable "training_image" { default = "382416733822.dkr.ecr.us-east-1.amazonaws.com/linear-learner:latest" }
variable "training_data_s3_path" { default = "" }
variable "model_output_path" { default = "" }
variable "sagemaker_role_arn" { default = "" }
