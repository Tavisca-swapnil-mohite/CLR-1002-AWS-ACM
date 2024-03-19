resource "aws_eip" "natgw" {
  count = var.eip_count
  domain = "vpc"
}
