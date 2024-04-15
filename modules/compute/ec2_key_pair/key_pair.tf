
###################################################### EXISTING KEY-PAIR ##########################################################################
resource "aws_key_pair" "existed-tf-key-pair" {
  count = var.existing_key_pair && !var.new_key_pair  ? 1 : 0

  key_name   = var.key_name
  public_key = var.public_key
  tags = var.tags
}

################################################################## NEW-KEY-PAIR ##################################################################
# key pair generation

resource "aws_key_pair" "tf-key-pair" {
   count = var.new_key_pair && !var.existing_key_pair  ? 1 : 0

   key_name = var.key_name
   public_key = tls_private_key.rsa[count.index].public_key_openssh
   tags = var.tags
}

resource "tls_private_key" "rsa" {
   count = var.new_key_pair && !var.existing_key_pair  ? 1 : 0

   algorithm = "RSA"
   rsa_bits  = 4096
}

resource "local_file" "tf-key" {
  count = var.new_key_pair && !var.existing_key_pair  ? 1 : 0
  content  = tls_private_key.rsa[count.index].private_key_pem
  filename = var.key_name
}

