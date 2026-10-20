
variable "region" {
  description = "region where deployment will be created"
  default     = "ap-southeast-1"
}

variable "prefix" {
  description = "prefix for resource names"
  default     = "bobo"
}

variable "create_vpc" {
  description = "Whether to create the VPC."
  type        = bool
  default     = true
}

variable "cidr_block_backend" {
  description = "CIDR block for the Backend VPC."
  default     = "192.168.0.0/16"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "backend_prefix" {
  description = "prefix for resource names"
  default     = "be"
}
