resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "private_key" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = "${path.module}/keys/${var.key_name}.pem"
  file_permission = "0400"

  depends_on = [tls_private_key.ssh]
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh.public_key_openssh

  depends_on = [tls_private_key.ssh]
}
