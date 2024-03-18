module "subnets" {
  source = "../root-subnets"

  vpc_id             = var.vpc_id
  cidr_block         = var.cidr_block
  subnet_count       = var.subnet_count
  availability_zones = var.availability_zones
  propagating_vgws   = var.propagating_vgws
  tags               = var.tags
  tags_for_resource  = var.tags_for_resource
}
