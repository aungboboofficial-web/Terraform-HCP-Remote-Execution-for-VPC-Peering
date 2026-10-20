data "aws_ami" "be_public_instance_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "backend_public_instance01" {
  ami                    = data.aws_ami.be_public_instance_ami.id
  instance_type          = var.be_instance_type
  key_name               = aws_key_pair.be_keypair.key_name
  subnet_id              = data.tfe_outputs.network.values.public_subnet_ids[0]
  vpc_security_group_ids = [data.tfe_outputs.security.values.be_pub_sgp01_id]

  tags = {
    Name        = "${var.backend_prefix}-public-instance01"
    Environment = var.environment
  }
}
resource "aws_eip" "backend_public_instance_eip" {
  domain = "vpc"

  tags = {
    Name        = "${var.backend_prefix}-public-instance-eip-${var.region}"
    Environment = var.environment
  }
}

resource "aws_eip_association" "be_public_instance_eip_assoc" {
  instance_id   = aws_instance.backend_public_instance01.id
  allocation_id = aws_eip.backend_public_instance_eip.id
}


# Private instance 01


data "aws_ami" "ubuntu_2404" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "backend_private_instance-01" {
  

  ami                         = data.aws_ami.ubuntu_2404.id
  instance_type               = var.be_instance_type
  key_name                    = aws_key_pair.be_keypair.key_name
  subnet_id                   = data.tfe_outputs.network.values.private_subnet_ids[0]
  vpc_security_group_ids      = [data.tfe_outputs.security.values.be_pri_sgp01_id]
  associate_public_ip_address = false

    tags = {
    Name        = "${var.backend_prefix}-private-instance-01"
    Environment = var.environment
  }
}

# Private instance 02



resource "aws_instance" "backend_private_instance-02" {

  ami                         = data.aws_ami.ubuntu_2404.id
  instance_type               = var.be_instance_type
  key_name                    = aws_key_pair.be_keypair.key_name
  subnet_id                   = data.tfe_outputs.network.values.private_subnet_ids[1]
  vpc_security_group_ids      = [data.tfe_outputs.security.values.be_pri_sgp02_id]
  associate_public_ip_address = false

    tags = {
    Name        = "${var.backend_prefix}-private-instance-02"
    Environment = var.environment
  }
}

#----------------------------------------------------------------
# Private instance 03 — pri-subnet3 (10.0.255.0/24)



resource "aws_instance" "backend_private_instance03" {
  ami                         = data.aws_ami.ubuntu_2404.id
  instance_type               = var.be_instance_type
  key_name                    = aws_key_pair.be_keypair.key_name
  subnet_id                   = data.tfe_outputs.network.values.private_subnet_ids[2]
  vpc_security_group_ids      = [data.tfe_outputs.security.values.be_pri_sgp03_id]
  associate_public_ip_address = false

    tags = {
    Name        = "${var.backend_prefix}-private-instance-03"
    Environment = var.environment
  }
}