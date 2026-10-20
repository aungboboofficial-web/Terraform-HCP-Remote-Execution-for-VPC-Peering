
variable "region" {
  description = "region where deployment will be created"
  default     = "ap-southeast-1"
}

variable "prefix" {
  description = "prefix for resource names"
  default     = "bobo"
}
variable "backend_prefix" {
  description = "prefix for resource names"
  default     = "be"
}
variable "create_vpc" {
  description = "Whether to create the VPC."
  type        = bool
  default     = true
}

# variable "cidr_block_frontend" {
#   description = "CIDR block for the Frontend VPC."
#   default     = "192.0.0.0/16"
# }

variable "environment" {
  type    = string
  default = "dev"
}
variable "backend_environment" {
  type    = string
  default = "be"
}

variable "be_instance_type" {
  description = "Specifies the AWS instance type."
  default     = "t2.micro"
}

