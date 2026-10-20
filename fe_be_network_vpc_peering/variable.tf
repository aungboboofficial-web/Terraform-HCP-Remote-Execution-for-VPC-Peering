variable "region" {
  description = "region where deployment will be created"
  default     = "ap-southeast-1"
}

variable "fe_be_prefix" {
  description = "prefix for the frontend-backend peering resources"
  default     = "fe-be"
}
variable "environment" {
  type    = string
  default = "dev"
}

