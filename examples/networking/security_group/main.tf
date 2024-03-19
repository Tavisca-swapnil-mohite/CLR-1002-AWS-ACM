
module "security_groups" {
  source          = "../../../modules/network/security_group"

  vpc_id          = var.vpc_id
  security_groups = var.security_groups

}
