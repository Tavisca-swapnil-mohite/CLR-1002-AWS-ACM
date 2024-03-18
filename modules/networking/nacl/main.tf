resource "aws_network_acl" "public_nacl" {
  # count = length(var.all_layer_subnet_ids)
  subnet_ids = var.all_layer_subnet_ids[0]
  vpc_id = var.vpc_id
  dynamic "egress" {
    for_each = var.public_nacl_map
    content {
      protocol   = "tcp"
      rule_no    = egress.value["rule_num"]
      action     = "allow"
      cidr_block = egress.value["cidr"]
      from_port  = egress.value["from_port"]
      to_port    = egress.value["to_port"]
    }
  }
  dynamic "ingress" {
    for_each = var.public_nacl_map
    content {
      protocol   = "tcp"
      rule_no    = ingress.value["rule_num"]
      action     = "allow"
      cidr_block = ingress.value["cidr"]
      from_port  = ingress.value["from_port"]
      to_port    = ingress.value["to_port"]
    }
  }
  tags = {
    Name = "public-nacl"
  }
}
resource "aws_network_acl" "app_nacl" {
  # count = length(var.all_layer_subnet_ids)
  subnet_ids = var.all_layer_subnet_ids[1]
  vpc_id = var.vpc_id
  dynamic "egress" {
    for_each = var.app_nacl_map
    content {
      protocol   = "tcp"
      rule_no    = egress.value["rule_num"]
      action     = "allow"
      cidr_block = egress.value["cidr"]
      from_port  = egress.value["from_port"]
      to_port    = egress.value["to_port"]
    }
  }
  dynamic "ingress" {
    for_each = var.app_nacl_map
    content {
      protocol   = "tcp"
      rule_no    = ingress.value["rule_num"]
      action     = "allow"
      cidr_block = ingress.value["cidr"]
      from_port  = ingress.value["from_port"]
      to_port    = ingress.value["to_port"]
    }
  }
  tags = {
    Name = "app-nacl"
  }
}
resource "aws_network_acl" "web_nacl" {
  # count = length(var.all_layer_subnet_ids)
  subnet_ids = var.all_layer_subnet_ids[2]
  vpc_id = var.vpc_id
  dynamic "egress" {
    for_each = var.web_nacl_map
    content {
      protocol   = "tcp"
      rule_no    = egress.value["rule_num"]
      action     = "allow"
      cidr_block = egress.value["cidr"]
      from_port  = egress.value["from_port"]
      to_port    = egress.value["to_port"]
    }
  }
  dynamic "ingress" {
    for_each = var.web_nacl_map
    content {
      protocol   = "tcp"
      rule_no    = ingress.value["rule_num"]
      action     = "allow"
      cidr_block = ingress.value["cidr"]
      from_port  = ingress.value["from_port"]
      to_port    = ingress.value["to_port"]
    }
  }
  tags = {
    Name = "web-nacl"
  }
}
resource "aws_network_acl" "data_nacl" {
  # count = length(var.all_layer_subnet_ids)
  subnet_ids = var.all_layer_subnet_ids[3]
  vpc_id = var.vpc_id
  dynamic "egress" {
    for_each = var.data_nacl_map
    content {
      protocol   = "tcp"
      rule_no    = egress.value["rule_num"]
      action     = "allow"
      cidr_block = egress.value["cidr"]
      from_port  = egress.value["from_port"]
      to_port    = egress.value["to_port"]
    }
  }
  dynamic "ingress" {
    for_each = var.data_nacl_map
    content {
      protocol   = "tcp"
      rule_no    = ingress.value["rule_num"]
      action     = "allow"
      cidr_block = ingress.value["cidr"]
      from_port  = ingress.value["from_port"]
      to_port    = ingress.value["to_port"]
    }
  }
  tags = {
    Name = "data-nacl"
  }
}
resource "aws_network_acl" "mgmt_nacl" {
  # count = length(var.all_layer_subnet_ids)
  subnet_ids = var.all_layer_subnet_ids[4]
  vpc_id = var.vpc_id
  dynamic "egress" {
    for_each = var.mgmt_nacl_map
    content {
      protocol   = "tcp"
      rule_no    = egress.value["rule_num"]
      action     = "allow"
      cidr_block = egress.value["cidr"]
      from_port  = egress.value["from_port"]
      to_port    = egress.value["to_port"]
    }
  }
  dynamic "ingress" {
    for_each = var.mgmt_nacl_map
    content {
      protocol   = "tcp"
      rule_no    = ingress.value["rule_num"]
      action     = "allow"
      cidr_block = ingress.value["cidr"]
      from_port  = ingress.value["from_port"]
      to_port    = ingress.value["to_port"]
    }
  }
  tags = {
    Name = "mgmt-nacl"
  }
}