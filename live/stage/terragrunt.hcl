/*
include {
  path = find_in_parent_folders()
}

locals {
  environment = "stage"
  account_id  = "123456789012"
  regions     = local.regions_by_env[local.environment]
}

terraform {
  source = "../../terraform-modules/sagemaker"
}

# We can't loop regions inside terragrunt inputs for a module that expects a single region
# So the pipeline will invoke terragrunt with per-region override using --terragrunt-override-attr or separate run.
inputs = {
  environment = local.environment
  account_id  = local.account_id
  region      = local.regions[0] # default; CodeBuild will iterate regions using script
}
*/