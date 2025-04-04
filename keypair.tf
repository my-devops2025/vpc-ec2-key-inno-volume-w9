# Generate a new private key using TLS provider
resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
#public key in aws
resource "aws_key_pair" "key1" {
  key_name   = "awsterraformkeypair" # Change to your preferred key name
  public_key = tls_private_key.ssh-key.public_key_openssh
}

#download key
resource "local_file" "localf" {
  filename = "awsterraformkeypair.pem"
  content = tls_private_key.ssh-key.private_key_openssh
  file_permission = 0400
}