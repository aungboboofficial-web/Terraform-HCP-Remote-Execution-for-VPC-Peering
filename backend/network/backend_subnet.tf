#Backend Public Subnet 1

resource "aws_subnet" "be-pub-subnet1" {
  vpc_id     = aws_vpc.backend.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "ap-southeast-1a"
  map_public_ip_on_launch = true


  tags = {
    Name        = "${var.backend_prefix}-public-subnet1"
    Environment = var.environment
  }
}

#Backend Public Subnet 2

resource "aws_subnet" "be-pub-subnet2" {
  vpc_id     = aws_vpc.backend.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = true


  tags = {
    Name        = "${var.backend_prefix}-public-subnet2"
    Environment = var.environment
  }
}
#Backend Public Subnet 3

resource "aws_subnet" "be-pub-subnet3" {
  vpc_id     = aws_vpc.backend.id
  cidr_block = "192.168.3.0/24"
  availability_zone = "ap-southeast-1c"
  map_public_ip_on_launch = true


  tags = {
    Name        = "${var.backend_prefix}-public-subnet3"
    Environment = var.environment
  }
}
#----------------------------------------------------------------
#Backend Private Subnet 1

resource "aws_subnet" "be-pri-subnet1" {
  vpc_id     = aws_vpc.backend.id
  cidr_block = "192.168.253.0/24"
  availability_zone = "ap-southeast-1a"
  map_public_ip_on_launch = false


  tags = {
    Name        = "${var.backend_prefix}-private-subnet1"
    Environment = var.environment
  }
}

#Backend Private Subnet 2

resource "aws_subnet" "be-pri-subnet2" {
  vpc_id     = aws_vpc.backend.id
  cidr_block = "192.168.254.0/24"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = false


  tags = {
    Name        = "${var.backend_prefix}-private-subnet2"
    Environment = var.environment
  }
}

#Backend Private Subnet 3

resource "aws_subnet" "be-pri-subnet3" {
  vpc_id     = aws_vpc.backend.id
  cidr_block = "192.168.255.0/24"
  availability_zone = "ap-southeast-1c"
  map_public_ip_on_launch = false


  tags = {
    Name        = "${var.backend_prefix}-private-subnet3"
    Environment = var.environment
  }
}