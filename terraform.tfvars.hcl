inputs = {
  account_id = "123456789012"         # replace with your AWS account ID
  region     = "us-east-1"            # default region
  environment = "dev"
  
  # optional multi-region example
  regions = ["us-east-1"]

  # S3 backend info (if using your s3-backend module)
  backend_bucket_prefix = "tf-backend-us-east-1-aaec78ed"
  # dynamodb_table_name   = "terraform-locks"
}

