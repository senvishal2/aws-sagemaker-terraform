output "backend_bucket_name" {
  value = aws_s3_bucket.backend.bucket
}

# output "artifact_bucket_name" {
#   value = aws_s3_bucket.artifacts.id
# }

# output "dynamodb_table" {
#   value = aws_dynamodb_table.lock.id
# }
output "artifact_bucket_name" {
  description = "S3 bucket name for storing CodePipeline artifacts"
  value       = aws_s3_bucket.artifacts.bucket
}