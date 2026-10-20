#backend VPC

resource "aws_vpc" "backend" {
  cidr_block           = var.cidr_block_backend
  enable_dns_support   = true
  enable_dns_hostnames = true


  tags = {
    Name        = "${var.backend_prefix}-vpc"
    Environment = var.environment
  }
}