#this resource block is used to generate unique name for the resources generated by the module
resource "random_id" "name" { 
  byte_length = 2
  prefix      = "demo"
}

module "vpc" {
  source = "../../../../modules/networking/vpc"

  cidr_block = var.vpc_cidr_block
  secondary_cidr_blocks = var.secondary_cidr_blocks
  s3_bucket_name_for_vpc_flow_logs = var.s3_bucket_name_for_vpc_flow_logs
  enable_vpc_flow_log = true
  tags = {
    Name = "${var.vpc_name}-${random_id.name.hex}"
  }
}

# One subnet should take the whole CIDR block:

module "data-subnet" {
  source = "../../../../modules/networking/subnets/data-subnets"
  depends_on = [ module.natgw ]
  vpc_id = module.vpc.vpc_id
  cidr_block         = var.subnet_variables.data-subnets.cidr_block
  subnet_count       = var.subnet_variables.data-subnets.count
  availability_zones = var.availability_zones 
  nat_gateway_count = var.natgw_count
  nat_gateway_ids = module.natgw.nat_gateway_ids
  tags = {
    Name = "${var.subnet_variables.data-subnets.name}"
  }
}

# Two subnets should split the CIDR block in half.

module "web-subnet" {
  source = "../../../../modules/networking/subnets/web-subnets"
  depends_on = [ module.natgw ]
  vpc_id             = module.vpc.vpc_id
  cidr_block         = var.subnet_variables.web-subnets.cidr_block
  subnet_count       = var.subnet_variables.web-subnets.count
  availability_zones = var.availability_zones
  nat_gateway_count = var.natgw_count
  nat_gateway_ids = module.natgw.nat_gateway_ids
  tags = {
    Name = "${var.subnet_variables.web-subnets.name}-${random_id.name.hex}"
  }
}

module "app-subnet" {
  source = "../../../../modules/networking/subnets/app-subnets"
  depends_on = [ module.natgw ]
  vpc_id             = module.vpc.vpc_id
  cidr_block         = var.subnet_variables.app-subnets.cidr_block
  subnet_count       = var.subnet_variables.app-subnets.count
  availability_zones = var.availability_zones
  nat_gateway_count = var.natgw_count
  nat_gateway_ids = module.natgw.nat_gateway_ids

  tags = {
    Name = "${var.subnet_variables.app-subnets.name}-${random_id.name.hex}"
  }

 }

module "mgmt-subnet" {
  source = "../../../../modules/networking/subnets/mgmt-subnets"
  depends_on = [ module.natgw ]
  vpc_id             = module.vpc.vpc_id
  cidr_block         = var.subnet_variables.mgmt-subnets.cidr_block
  subnet_count       = var.subnet_variables.mgmt-subnets.count
  availability_zones = var.availability_zones
  nat_gateway_count = var.natgw_count
  nat_gateway_ids = module.natgw.nat_gateway_ids
  tags = {
    Name = "${var.subnet_variables.mgmt-subnets.name}-${random_id.name.hex}"
  }

}



module "public-subnet" {
  source = "../../../../modules/networking/subnets/public-subnets"
  vpc_id             = module.vpc.vpc_id
  cidr_block         = var.subnet_variables.public-subnets.cidr_block
  subnet_count       = var.subnet_variables.public-subnets.count
  availability_zones = var.availability_zones
  gateway_id = module.vpc.internet_gateway_id
  tags = {
    Name = "${var.subnet_variables.public-subnets.name}-${random_id.name.hex}"
  }

}


module "secondary-range-subnet" {
  source = "../../../../modules/networking/subnets/secondary-range-subnets"
  depends_on = [ module.natgw ]
  vpc_id             = module.vpc.vpc_id
  cidr_block         = var.subnet_variables.secondary-range-subnets.cidr_block
  subnet_count       = var.subnet_variables.secondary-range-subnets.count
  availability_zones = var.availability_zones
  tags = {
    Name = "${var.subnet_variables.secondary-range-subnets.name}-${random_id.name.hex}"
  }

}

module "natgw" {
  source = "../../../../modules/networking/nat-gateways"
  depends_on = [ module.public-subnet ]
  subnet_ids = [ module.public-subnet.subnet_ids[0] , module.public-subnet.subnet_ids[1] ]
}