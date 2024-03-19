resource "aws_dax_subnet_group" "dax_subnet_group" {
  name       = var.subnet_group_details.name
  subnet_ids = var.subnet_group_details.subnet_id
}
