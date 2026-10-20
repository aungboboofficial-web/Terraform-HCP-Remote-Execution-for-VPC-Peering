output "vpc_id" {
  value = aws_vpc.frontend.id
}

output "vpc_cidr" {
  value = aws_vpc.frontend.cidr_block
}
output "fe_private_rtb_02_id" {
  value = aws_route_table.fe-private-rtb-02.id
}

output "fe_private_rtb_03_id" {
  value = aws_route_table.fe-private-rtb-03.id
}
output "public_subnet_ids" {
  value = [
    aws_subnet.fe-pub-subnet1.id,
    aws_subnet.fe-pub-subnet2.id,
    aws_subnet.fe-pub-subnet3.id,
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.fe-pri-subnet1.id,
    aws_subnet.fe-pri-subnet2.id,
    aws_subnet.fe-pri-subnet3.id,
  ]
}

