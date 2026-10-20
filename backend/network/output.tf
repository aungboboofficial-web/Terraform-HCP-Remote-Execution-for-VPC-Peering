output "vpc_id" {
  value = aws_vpc.backend.id
}

output "vpc_cidr" {
  value = aws_vpc.backend.cidr_block
}
output "be_private_rtb_02_id" {
  value = aws_route_table.be-private-rtb-02.id
}

output "be_private_rtb_03_id" {
  value = aws_route_table.be-private-rtb-03.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.be-pub-subnet1.id,
    aws_subnet.be-pub-subnet2.id,
    aws_subnet.be-pub-subnet3.id,
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.be-pri-subnet1.id,
    aws_subnet.be-pri-subnet2.id,
    aws_subnet.be-pri-subnet3.id,
  ]
}

