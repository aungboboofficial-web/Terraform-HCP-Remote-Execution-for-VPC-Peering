locals {
  fe_private_key_filename = "${var.frontend_prefix}-ssh-key.pem"

}

resource "tls_private_key" "fe_keypair" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "fe_keypair" {
  key_name   = local.fe_private_key_filename
  public_key = tls_private_key.fe_keypair.public_key_openssh
}


output "fe_instances_private_key" {
  description = "Private key for SSH access"
  value       = tls_private_key.fe_keypair.private_key_openssh
  sensitive   = true
}

# terraform output -raw fe_instances_private_key > fe-sshkey.pem
# chmod 400 fe-sshkey.pem
# curl -s http://169.254.169.254/latest/meta-data/public-ipv4
