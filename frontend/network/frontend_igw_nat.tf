#----------------------------------------------------------------
# Frontend internet gateway
resource "aws_internet_gateway" "fe-igw" {
  vpc_id = aws_vpc.frontend.id

  tags = {
    Name        = "${var.prefix}-frontend-internet-gateway"
    Environment = var.environment
  }
}

#----------------------------------------------------------------
# Elastic IP for the NAT gateway
resource "aws_eip" "fe-nat-eip" {
  domain = "vpc"

  tags = {
    Name = "${var.prefix}-frontend-nat-eip"
  }
}

#----------------------------------------------------------------
# Frontend NAT gateway — lives in a PUBLIC subnet
resource "aws_nat_gateway" "fe-natgw" {
  allocation_id = aws_eip.fe-nat-eip.id
  subnet_id     = aws_subnet.fe-pub-subnet1.id

  depends_on = [aws_internet_gateway.fe-igw]

  tags = {
    Name        = "${var.prefix}-frontend-nat-gateway"
    Environment = var.environment
  }
}