

#----------------------------------------------------------------
#frontend public route table

#----------------------------------------------------------------
# Public route table — pub-subnet1 only
resource "aws_route_table" "fe-public-rtb" {
  vpc_id = aws_vpc.frontend.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fe-igw.id
  }

  tags = {
    Name        = "${var.frontend_prefix}-public-rtb"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "fe-public-subnet1" {
  subnet_id      = aws_subnet.fe-pub-subnet1.id
  route_table_id = aws_route_table.fe-public-rtb.id
}


#----------------------------------------------------------------
# Private route table 01 — pri-subnet1
resource "aws_route_table" "fe-private-rtb-01" {
  vpc_id = aws_vpc.frontend.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.fe-natgw.id
  }
  route {
    cidr_block     = "10.0.0.0/16"
    gateway_id     = "local"
  }

  tags = {
    Name        = "${var.frontend_prefix}-private-rtb-01"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "fe-private-subnet1" {
  subnet_id      = aws_subnet.fe-pri-subnet1.id
  route_table_id = aws_route_table.fe-private-rtb-01.id
}

#----------------------------------------------------------------
# Private route table 02 — pri-subnet2
resource "aws_route_table" "fe-private-rtb-02" {
  vpc_id = aws_vpc.frontend.id

  route {
    cidr_block     = "10.0.0.0/16"
    gateway_id     = "local"
  }

  tags = {
    Name        = "${var.frontend_prefix}-private-rtb-02"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "fe-private-subnet2" {
  subnet_id      = aws_subnet.fe-pri-subnet2.id
  route_table_id = aws_route_table.fe-private-rtb-02.id
}

# Private route table 03 — pri-subnet3
resource "aws_route_table" "fe-private-rtb-03" {
  vpc_id = aws_vpc.frontend.id

 route {
    cidr_block     = "10.0.0.0/16"
    gateway_id     = "local"
  }

  tags = {
    Name        = "${var.frontend_prefix}-private-rtb-03"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "fe-private-subnet3" {
  subnet_id      = aws_subnet.fe-pri-subnet3.id
  route_table_id = aws_route_table.fe-private-rtb-03.id
}
