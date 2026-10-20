#Frontend Public Subnet 1

resource "aws_subnet" "fe-pub-subnet1" {
  vpc_id     = aws_vpc.frontend.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"
  map_public_ip_on_launch = true


  tags = {
    Name        = "${var.frontend_prefix}-public-subnet1"
    Environment = var.environment
  }
}

#Frontend Public Subnet 2

resource "aws_subnet" "fe-pub-subnet2" {
  vpc_id     = aws_vpc.frontend.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = true


  tags = {
    Name        = "${var.frontend_prefix}-public-subnet2"
    Environment = var.environment
  }
}
#Frontend Public Subnet 3

resource "aws_subnet" "fe-pub-subnet3" {
  vpc_id     = aws_vpc.frontend.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-southeast-1c"
  map_public_ip_on_launch = true


  tags = {
    Name        = "${var.frontend_prefix}-public-subnet3"
    Environment = var.environment
  }
}
#----------------------------------------------------------------
#Frontend Private Subnet 1

resource "aws_subnet" "fe-pri-subnet1" {
  vpc_id     = aws_vpc.frontend.id
  cidr_block = "10.0.253.0/24"
  availability_zone = "ap-southeast-1a"
  map_public_ip_on_launch = false


  tags = {
    Name        = "${var.frontend_prefix}-private-subnet1"
    Environment = var.environment
  }
}

#Frontend Private Subnet 2

resource "aws_subnet" "fe-pri-subnet2" {
  vpc_id     = aws_vpc.frontend.id
  cidr_block = "10.0.254.0/24"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = false


  tags = {
    Name        = "${var.frontend_prefix}-private-subnet2"
    Environment = var.environment
  }
}

#Frontend Private Subnet 3

resource "aws_subnet" "fe-pri-subnet3" {
  vpc_id     = aws_vpc.frontend.id
  cidr_block = "10.0.255.0/24"
  availability_zone = "ap-southeast-1c"
  map_public_ip_on_launch = false


  tags = {
    Name        = "${var.frontend_prefix}-private-subnet3"
    Environment = var.environment
  }
}