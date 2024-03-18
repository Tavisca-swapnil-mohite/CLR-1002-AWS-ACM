module "subnets" {
  source = "../root-subnets"

  vpc_id             = var.vpc_id
  cidr_block         = var.cidr_block
  subnet_count       = var.subnet_count
  availability_zones = var.availability_zones
  propagating_vgws   = var.propagating_vgws
  tags               = var.tags
  tags_for_resource  = var.tags_for_resource
  ipv4_routes = var.ipv4_routes
}

resource "aws_route" "nat_gateway" {
  count = var.subnet_count
  destination_cidr_block = var.destination_cidr_block
  route_table_id         = element(module.subnets.route_table_ids, count.index)
  nat_gateway_id         = element(var.nat_gateway_ids,count.index)
}
