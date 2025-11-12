variable "environment" {
  description = "Deployment environment name (e.g. dev, stage, prod)"
  type        = string
}

variable "attach_admin_policy" {
  description = "Whether to attach AdministratorAccess to the SageMaker role (useful for dev)"
  type        = bool
  default     = true
}
