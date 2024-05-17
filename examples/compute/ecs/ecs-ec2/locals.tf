locals {
  region = "us-east-1"
  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  container_name = var.container_name
  container_port = var.container_port
  tags = var.tags
}