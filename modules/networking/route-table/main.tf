
###################################################
# Route table
###################################################
resource "aws_route_table" "default" {
  vpc_id           = var.vpc_id
  propagating_vgws = var.propagating_vgws
  tags = var.tags
}


###################################################
# IPv4 Routes
###################################################

resource "aws_route" "ipv4" {
  for_each = {
    for route in var.ipv4_routes :
    route.destination => route
  }

  route_table_id         = aws_route_table.default.id
  destination_cidr_block = each.key


  ## Targets
  carrier_gateway_id = (each.value.target.type == "CARRIER_GATEWAY"
    ? each.value.target.id
    : null
  )
  core_network_arn = (each.value.target.type == "CORE_NETWORK"
    ? each.value.target.id
    : null
  )
  egress_only_gateway_id = (each.value.target.type == "EGRESS_ONLY_INTERNET_GATEWAY"
    ? each.value.target.id
    : null
  )
  gateway_id = (contains(["INTERNET_GATEWAY", "VPN_GATEWAY"], each.value.target.type)
    ? each.value.target.id
    : null
  )
  local_gateway_id = (each.value.target.type == "LOCAL_GATEWAY"
    ? each.value.target.id
    : null
  )
  nat_gateway_id = (each.value.target.type == "NAT_GATEWAY"
    ? each.value.target.id
    : null
  )
  network_interface_id = (each.value.target.type == "NETWORK_INTERFACE"
    ? each.value.target.id
    : null
  )
  transit_gateway_id = (each.value.target.type == "TRANSIT_GATEWAY"
    ? each.value.target.id
    : null
  )
  vpc_endpoint_id = (each.value.target.type == "VPC_ENDPOINT"
    ? each.value.target.id
    : null
  )
  vpc_peering_connection_id = (each.value.target.type == "VPC_PEERING_CONNECTION"
    ? each.value.target.id
    : null
  )
}
