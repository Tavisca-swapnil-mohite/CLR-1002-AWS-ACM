

module "security_group_1" {
  source        = "../../../modules/networking/security_group"
  vpc_id        = var.vpc_id
  name          = var.security_group_1_name
  ingress_rules = var.ingress_rules_sg1
  egress_rules  = var.egress_rules_sg1
}

module "security_group_2" {
  source        = "../../../modules/networking/security_group"
  vpc_id        = var.vpc_id
  name          = var.security_group_2_name
  ingress_rules = var.ingress_rules_sg2
  egress_rules  = var.egress_rules_sg2
}

module "security_group_3" {
  source        = "../../../modules/networking/security_group"
  vpc_id        = var.vpc_id
  name          = var.security_group_3_name
  ingress_rules = var.ingress_rules_sg3
  egress_rules  = var.egress_rules_sg3
}

