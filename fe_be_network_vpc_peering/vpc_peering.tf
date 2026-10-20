resource "aws_vpc_peering_connection" "fevpc_peering_bevpc" {
  vpc_id      = data.tfe_outputs.fe_network.values.vpc_id
  peer_vpc_id = data.tfe_outputs.be_network.values.vpc_id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name        = "${var.fe_be_prefix}-public-subnet1"
    Environment = var.environment
  }
}

resource "aws_route" "fevpc_private_subnet02_to_bevpc_private_subnet02" {
  route_table_id            = data.tfe_outputs.fe_network.values.fe_private_rtb_02_id.id
  destination_cidr_block    = "192.168.254.0/24"
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

resource "aws_route" "bevpc_private_subnet02_to_fevpc_private_subnet02" {
  route_table_id            = data.tfe_outputs.be_network.values.be_private_rtb_02_id.id
  destination_cidr_block    = "10.0.254.0/24"
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

resource "aws_route" "fevpc_private_subnet03_to_bevpc_private_subnet03" {
  route_table_id            = data.tfe_outputs.fe_network.values.fe_private_rtb_03_id.id  
  destination_cidr_block    = "192.168.255.0/24"
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

resource "aws_route" "bevpc_private_subnet03_to_fevpc_private_subnet03" {
  route_table_id            = data.tfe_outputs.be_network.values.be_private_rtb_03_id.id
  destination_cidr_block    = "10.0.255.0/24"
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}