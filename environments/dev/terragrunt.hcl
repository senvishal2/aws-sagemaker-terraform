terraform {
  source = "../../terraform-modules/sagemaker"
}

# Load global configuration
locals {
  root_vars   = read_terragrunt_config(find_in_parent_folders("terraform.tfvars.hcl"))
  env_config  = read_terragrunt_config("${get_repo_root()}/env-config.hcl")

  environment = "dev"
  account_id  = local.root_vars.inputs.account_id
  regions_by_env = local.env_config.locals.regions_by_env
  regions     = local.regions_by_env[local.environment]
  region      = local.regions[0]  # default region
}

inputs = {
  environment = local.environment
  account_id  = local.account_id
  region      = local.region
}