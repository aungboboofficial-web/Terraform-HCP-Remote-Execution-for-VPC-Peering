locals {
  be_private_key_filename = "${var.backend_prefix}-ssh-key.pem"

}

resource "tls_private_key" "be_keypair" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "be_keypair" {
  key_name   = local.be_private_key_filename
  public_key = tls_private_key.be_keypair.public_key_openssh
}


output "be_instances_private_key" {
  description = "Private key for SSH access"
  value       = tls_private_key.be_keypair.private_key_openssh
  sensitive   = true
}

# terraform output -raw be_instances_private_key > be-sshkey.pem
# chmod 400 be-sshkey.pem
# curl -s http://169.254.169.254/latest/meta-data/public-ipv4
