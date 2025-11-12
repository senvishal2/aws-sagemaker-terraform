locals {
  regions_by_env = {
    dev   = ["us-east-1"]
    # stage = ["us-east-1","us-west-2"]
    # prod  = ["us-east-1"]
  }
}

outputs = {
  regions_by_env = local.regions_by_env
}
