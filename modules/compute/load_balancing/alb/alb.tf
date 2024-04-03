resource "aws_lb" "my_alb" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = "application"
  subnets            = var.subnets
  security_groups    = var.security_groups

  enable_deletion_protection = var.enable_deletion_protection

  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing

  tags = {
    Environment        = var.environment
    AppName            = var.appName
    InfraOwner         = var.infraOwner
    BusinessUnit       = var.businessUnit
    Backup             = var.backup
    Name               = var.name
    DataClassification = var.dataClassification
    Product            = var.product
  }
}
