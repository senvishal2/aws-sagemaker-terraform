module "iam_role" {
  source      = "./terraform-modules/iam"
  environment = var.environment
}

module "s3_artifact_bucket" {
  source          = "./terraform-modules/s3-backend"
  region          = var.s3_bucket_region
  artifact_bucket = var.artifact_bucket
}