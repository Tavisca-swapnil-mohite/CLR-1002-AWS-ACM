# Standard subnet variables

variable "vpc_id" {
  description = "The ID of the VPC to create the subnets in"
  type        = string
}

variable "cidr_block" {
  description = "The larger CIDR block to use for calculating individual subnet CIDR blocks"
  type        = string
}

variable "subnet_count" {
  description = "The number of subnets to create"
  type        = string
}

variable "availability_zones" {
  description = "A list of availability zones to create the subnets in"
  type        = list(string)
}

variable "propagating_vgws" {
  description = "A list of virtual gateways for route propagation"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "tags_for_resource" {
  description = "A nested map of tags to assign to specific resource types"
  type        = map(map(string))
  default     = {}
}

# Private subnet variables

variable "nat_gateway_count" {
  description = "The number of NAT gateways to use for routing, must match subnet_count and nat_gateway_ids"
#  default     = 0
}

variable "nat_gateway_ids" {
  description = "A list of NAT Gateway IDs to use for routing"
#  default     = []
}

variable "ipv4_routes" {
  description = <<EOF
  (Optional) A list of route rules for destinations to IPv4 CIDRs. Each block of `ipv4_routes` as defined below.
    (Required) `destination` - The destination IPv4 CIDR block of the route rule.
    (Required) `target` - A configuration of the target of the route rule. `target` as defined below.
      (Required) `type` - The type of the target of the route rule. Valid values are `CARRIER_GATEWAY`, `CORE_GATEWAY`, `EGRESS_ONLY_INTERNET_GATEWAY`, `INTERNET_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `NAT_GATEWAY`, `NETWORK_INTERFACE`, `TRANSIT_GATEWAY`, `VPC_ENDPOINT`, `VPC_PEERING_CONNECTION`.
      (Required) `id` - The ID of the target of the route rule.
  EOF
  type = list(object({
    destination = string

    target = object({
      type = string
      id   = string
    })
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for route in var.ipv4_routes :
      contains(["CARRIER_GATEWAY", "CORE_GATEWAY", "EGRESS_ONLY_INTERNET_GATEWAY", "INTERNET_GATEWAY", "VPN_GATEWAY", "LOCAL_GATEWAY", "NAT_GATEWAY", "NETWORK_INTERFACE", "TRANSIT_GATEWAY", "VPC_ENDPOINT", "VPC_PEERING_CONNECTION"], route.target.type)
    ])
    error_message = "Valid values for `type` are `CARRIER_GATEWAY`, `CORE_GATEWAY`, `EGRESS_ONLY_INTERNET_GATEWAY`, `INTERNET_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `NAT_GATEWAY`, `NETWORK_INTERFACE`, `TRANSIT_GATEWAY`, `VPC_ENDPOINT`, `VPC_PEERING_CONNECTION`."
  }
}