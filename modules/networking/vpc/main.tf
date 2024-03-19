data "aws_region" "current" {}

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = merge(var.tags, lookup(var.tags_for_resource, "aws_vpc", {}))
}

resource "aws_default_route_table" "vpc" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  tags                   = merge(var.tags, lookup(var.tags_for_resource, "aws_default_route_table", {}))
}

resource "aws_vpc_dhcp_options" "vpc" {
  count = var.enable_dhcp_options == true ? 1 : 0
  #The coalesce function takes any number of arguments and returns the first one that isn't null or an empty string. It is useful when you need to provide defaults, set missing values, or prioritize different value sources
  domain_name = coalesce(
    var.domain_name,
    "${data.aws_region.current.name}.compute.internal",
  )
  domain_name_servers = var.domain_name_servers
  tags                = merge(var.tags, lookup(var.tags_for_resource, "aws_vpc_dhcp_options", {}))
}

resource "aws_vpc_dhcp_options_association" "vpc_dhcp" {
  count           = var.enable_dhcp_options == true ? 1 : 0
  vpc_id          = aws_vpc.vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.vpc[0].id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(var.tags, lookup(var.tags_for_resource, "aws_internet_gateway", {}))
}

resource "aws_vpc_ipv4_cidr_block_association" "this" {
  count = length(var.secondary_cidr_blocks) > 0 ? length(var.secondary_cidr_blocks) : 0

  vpc_id = aws_vpc.vpc.id

  cidr_block = element(var.secondary_cidr_blocks, count.index)
}



resource "aws_flow_log" "vpc_flow_log" {
    count = var.enable_vpc_flow_log ? 1 : 0

    log_destination      = var.s3_bucket_name_for_vpc_flow_logs
    log_destination_type = "s3"
    traffic_type         = "ALL"
    vpc_id               = aws_vpc.vpc.id
}