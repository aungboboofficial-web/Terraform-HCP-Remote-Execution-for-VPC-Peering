#Public Security Group for Frontend Instance 01

resource "aws_security_group" "pub-sgp-01" {
  name        = "pub-sgp-01"
  description = "Public security group for hc-frontend-public-instance1"
  vpc_id      = data.tfe_outputs.network.values.vpc_id

  tags = {
    Name        = "${var.frontend_prefix}-pub-sgp-01"
    Environment = var.frontend_environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "public-instance-01_allow_ssh" {
  security_group_id = aws_security_group.pub-sgp-01.id
  cidr_ipv4         = var.my_ip_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "public-instance-01_allow_icmp" {
  security_group_id = aws_security_group.pub-sgp-01.id
  cidr_ipv4         = var.my_ip_cidr
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_public-instance-01" {
  security_group_id = aws_security_group.pub-sgp-01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
#----------------------------------------------------------------
#Private Security Group for Frontend Private Instance 01

resource "aws_security_group" "pri-sgp-01" {
  name        = "pri-sgp-01"
  description = "Private security group for hc-frontend-private-instance1"
  vpc_id      = data.tfe_outputs.network.values.vpc_id

  tags = {
    Name        = "${var.frontend_prefix}-pri-sgp-01"
    Environment = var.frontend_environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "private-instance-01_allow_ssh" {
  security_group_id = aws_security_group.pri-sgp-01.id
  referenced_security_group_id = aws_security_group.pub-sgp-01.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "private-instance-01_allow_icmp" {
  security_group_id = aws_security_group.pri-sgp-01.id
  referenced_security_group_id = aws_security_group.pub-sgp-01.id
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_private-instance-01" {
  security_group_id = aws_security_group.pri-sgp-01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#----------------------------------------------------------------
#Private Security Group for Frontend Private Instance 02

resource "aws_security_group" "pri-sgp-02" {
  name        = "pri-sgp-02"
  description = "Private security group for hc-frontend-private-instance2"
  vpc_id      = data.tfe_outputs.network.values.vpc_id

  tags = {
    Name        = "${var.frontend_prefix}-pri-sgp-02"
    Environment = var.frontend_environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "private-instance-02_allow_ssh" {
  security_group_id = aws_security_group.pri-sgp-02.id
  referenced_security_group_id = aws_security_group.pri-sgp-01.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "private-instance-02_allow_icmp" {
  security_group_id = aws_security_group.pri-sgp-02.id
  referenced_security_group_id = aws_security_group.pri-sgp-01.id
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}


# Allow ping FROM backend pri-sgp-02 TO frontend private-instance-02
resource "aws_vpc_security_group_ingress_rule" "fe_pri_sgp02_allow_icmp_from_be_pri_sgp02" {
  security_group_id            = aws_security_group.pri-sgp-02.id
  referenced_security_group_id = data.tfe_outputs.be_security.values.be_pri_sgp02_id
  from_port                    = 8
  to_port                      = 0
  ip_protocol                  = "icmp"
}

# Allow SSH FROM backend pri-sgp-02 TO frontend private-instance-02
resource "aws_vpc_security_group_ingress_rule" "fe_pri_sgp02_allow_ssh_from_be_pri_sgp02" {
  security_group_id            = aws_security_group.pri-sgp-02.id
  referenced_security_group_id = data.tfe_outputs.be_security.values.be_pri_sgp02_id
  from_port                    = 22
  to_port                      = 22
  ip_protocol                  = "tcp"
}

# Allow ping FROM frontend private-instance-02 TO backend private-instance-02
resource "aws_vpc_security_group_egress_rule" "fe_pri_sgp02_allow_icmp_to_be_pri_sgp02" {
  security_group_id            = aws_security_group.pri-sgp-02.id
  referenced_security_group_id = data.tfe_outputs.be_security.values.be_pri_sgp02_id
  from_port                    = 8
  to_port                      = 0
  ip_protocol                  = "icmp"
}

# Allow SSH FROM frontend private-instance-02 TO backend private-instance-02
resource "aws_vpc_security_group_egress_rule" "fe_pri_sgp02_allow_ssh_to_be_pri_sgp02" {
  security_group_id            = aws_security_group.pri-sgp-02.id
  referenced_security_group_id = data.tfe_outputs.be_security.values.be_pri_sgp02_id
  from_port                    = 22
  to_port                      = 22
  ip_protocol                  = "tcp"
}
#----------------------------------------------------------------
#Private Security Group for Frontend Private Instance 03

resource "aws_security_group" "pri-sgp-03" {
  name        = "pri-sgp-03"
  description = "Private security group for hc-frontend-private-instance3"
  vpc_id      = data.tfe_outputs.network.values.vpc_id

  tags = {
    Name        = "${var.frontend_prefix}-pri-sgp-03"
    Environment = var.frontend_environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "private-instance-03_allow_ssh" {
  security_group_id = aws_security_group.pri-sgp-03.id
  referenced_security_group_id = aws_security_group.pri-sgp-01.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "private-instance-03_allow_icmp" {
  security_group_id = aws_security_group.pri-sgp-03.id
  referenced_security_group_id = aws_security_group.pri-sgp-01.id
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}
resource "aws_vpc_security_group_ingress_rule" "private-instance-03-to-pri-instance-03_allow_icmp" {
  security_group_id = aws_security_group.pri-sgp-03.id
  referenced_security_group_id = data.tfe_outputs.be_security.values.be_pri_sgp03_id
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}

resource "aws_vpc_security_group_ingress_rule" "private-instance-03-to-pri-instance-03_allow_ssh" {
  security_group_id = aws_security_group.pri-sgp-03.id
  referenced_security_group_id = data.tfe_outputs.be_security.values.be_pri_sgp03_id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


# Allow ping FROM frontend private-instance-03 TO backend private-instance-03
resource "aws_vpc_security_group_egress_rule" "fe_pri_sgp03_allow_icmp_to_be_pri_sgp03" {
  security_group_id            = aws_security_group.pri-sgp-03.id
  referenced_security_group_id = data.tfe_outputs.be_security.values.be_pri_sgp03_id
  from_port                    = 8
  to_port                      = 0
  ip_protocol                  = "icmp"
}

# Allow SSH FROM frontend private-instance-03 TO backend private-instance-03
resource "aws_vpc_security_group_egress_rule" "fe_pri_sgp03_allow_ssh_to_be_pri_sgp03" {
  security_group_id            = aws_security_group.pri-sgp-03.id
  referenced_security_group_id = data.tfe_outputs.be_security.values.be_pri_sgp03_id
  from_port                    = 22
  to_port                      = 22
  ip_protocol                  = "tcp"
}