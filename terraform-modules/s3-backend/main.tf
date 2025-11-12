resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "backend" {
  bucket = "tf-backend-${var.region}-${random_id.bucket_suffix.hex}"
  # acl    = "private"
  force_destroy = true
}

# resource "aws_dynamodb_table" "lock" {
#   name         = "tf-lock-${var.environment}-${var.region}"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

resource "aws_s3_bucket" "artifacts" {
  bucket = var.artifact_bucket
  region = var.region
  # acl    = "private"
  force_destroy = true
}