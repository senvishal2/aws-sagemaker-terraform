provider "aws" {
  region = var.region
}

resource "aws_sagemaker_notebook_instance" "notebook" {
  name          = "${var.environment}-notebook-${var.region}"
  instance_type = "ml.t2.medium"
  role_arn      = var.sagemaker_role_arn
  tags = {
    Environment = var.environment
    Region      = var.region
  }
}

resource "aws_sagemaker_model" "model" {
  name               = "${var.environment}-model-${var.region}"
  execution_role_arn = var.sagemaker_role_arn

  primary_container {
    image = var.model_image
  }

  tags = {
    Environment = var.environment
    Region      = var.region
  }
}

output "notebook_id" {
  value = aws_sagemaker_notebook_instance.notebook.id
}

output "model_name" {
  value = aws_sagemaker_model.model.name
}
