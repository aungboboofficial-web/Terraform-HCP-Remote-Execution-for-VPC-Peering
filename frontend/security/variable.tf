
variable "region" {
  description = "region where deployment will be created"
  default     = "ap-southeast-1"
}

variable "prefix" {
  description = "prefix for resource names"
  default     = "bobo"
}

variable "frontend_prefix" {
  type    = string
  default = "fe"
}

variable "create_vpc" {
  description = "Whether to create the VPC."
  type        = bool
  default     = true
}

variable "cidr_block_frontend" {
  description = "CIDR block for the Frontend VPC."
  default     = "10.0.0.0/16"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "frontend_environment" {
  type    = string
  default = "dev_fe"
}

variable "my_ip_cidr" {
  type        = string
  description = "My public IP for SSH, in /32 form"
  default     = "210.10.76.226/32"
}