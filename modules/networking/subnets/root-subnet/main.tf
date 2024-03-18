
#################
# create subnets
#################
resource "aws_subnet" "subnets" {
  count = var.subnet_count

  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.cidr_block, ceil(log(var.subnet_count, 2)), count.index)
  availability_zone = element(var.availability_zones, count.index)

  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(var.tags, lookup(var.tags_for_resource, "aws_subnet", {}),{"az":element(var.availability_zones, count.index)})
  # add a tag of az = us-east-1a to the subnet
}

######################
# create route tables
######################
module "route_tables" {
  source = "../route-table"
  count = length(var.availability_zones)
  ipv4_routes = var.ipv4_routes
  vpc_id             = var.vpc_id
  propagating_vgws   = var.propagating_vgws
  tags               =  merge(var.tags, lookup(var.tags_for_resource, "aws_route_table", {}),{"az":element(var.availability_zones, count.index)})
}

################################
# create route table association
#################################
resource "aws_route_table_association" "default" {
  count = var.subnet_count

  subnet_id      = element(aws_subnet.subnets.*.id, count.index)
  route_table_id = element(module.route_tables.*.route_table_ids, count.index)
  #route_table_id = element(aws_route_table.default.*.id, count.index)
  #element(aws_subnet.subnets.*.tags_all.az, count.index) == "us-east-1a" ? data.aws_route_tables.az1.ids[0] : (element(aws_subnet.subnets.*.tags_all.az, count.index)== "us-east-1b"? data.aws_route_tables.az2.ids[0]: (element(aws_subnet.subnets.*.tags_all.az, count.index) == "us-east-1c" ? data.aws_route_tables.az3.ids[0]: data.aws_route_tables.az4.ids[0] ))
  #element(aws_subnet.subnets.*.tags_all.az, count.index) == "us-east-1a" ? element(aws_route_table.default.) : (element(aws_subnet.subnets.*.tags_all.az, count.index)== "us-east-1b"? data.aws_route_tables.az2.ids[0]: (element(aws_subnet.subnets.*.tags_all.az, count.index) == "us-east-1c" ? data.aws_route_tables.az3.ids[0]: data.aws_route_tables.az4.ids[0] ))
}


