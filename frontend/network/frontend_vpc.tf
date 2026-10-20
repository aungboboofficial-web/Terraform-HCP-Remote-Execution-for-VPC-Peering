#Frontend VPC

resource "aws_vpc" "frontend" {
  cidr_block           = var.cidr_block_frontend
  enable_dns_support   = true
  enable_dns_hostnames = true


  tags = {
    Name        = "${var.frontend_prefix}-vpc"
    Environment = var.environment
  }
}