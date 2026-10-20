#----------------------------------------------------------------
# Backend internet gateway
resource "aws_internet_gateway" "be-igw" {
  vpc_id = aws_vpc.backend.id

  tags = {
    Name        = "${var.prefix}-backend-internet-gateway"
    Environment = var.environment
  }
}

#----------------------------------------------------------------
# Elastic IP for the NAT gateway
resource "aws_eip" "be-nat-eip" {
  domain = "vpc"

  tags = {
    Name = "${var.prefix}-backend-nat-eip"
  }
}

#----------------------------------------------------------------
# Backend NAT gateway — lives in a PUBLIC subnet
resource "aws_nat_gateway" "be-natgw" {
  allocation_id = aws_eip.be-nat-eip.id
  subnet_id     = aws_subnet.be-pub-subnet1.id

  depends_on = [aws_internet_gateway.be-igw]

  tags = {
    Name        = "${var.prefix}-backend-nat-gateway"
    Environment = var.environment
  }
}