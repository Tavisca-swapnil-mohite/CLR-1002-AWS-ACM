data "aws_availability_zones" "available" {}

data "aws_ssm_parameter" "ecs_optimized_ami" {
  name = "Golden-AMI-ECS-Amazon2"
}

locals {
  region = "us-east-1"
  name   = "poap-ecs-ec2"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  container_name = "ecs-sample"
  container_port = 80

  tags = {
    AppName            = "IaC"
    Example            = local.name
    Backup             = "no"
    BusinessUnit       = "travel.poc"
    DataClassification = "internal"
    Environment        = "poc"
    InfraOwner         = "sre-cloud-reliability@tavisca.com"
    Name               = local.name
    Product            = "poap"
    Repository         = "https://github.com/terraform-aws-modules/terraform-aws-ecs"
  }
}


module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 6.5"

  for_each = {
    # On-demand instances
    ex_1 = {
      instance_type              = "t3.medium"
      use_mixed_instances_policy = false
      update_default_version      = true
      mixed_instances_policy     = {}
      user_data                  = <<-EOT
        #!/bin/bash

        cat <<'EOF' >> /etc/ecs/ecs.config
        ECS_CLUSTER=${local.name}
        ECS_LOGLEVEL=debug
        ECS_CONTAINER_INSTANCE_TAGS=${jsonencode(local.tags)}
        ECS_ENABLE_TASK_IAM_ROLE=true
        EOF
      EOT
    }
  }


  name = "${local.name}-${each.key}"

  image_id      = data.aws_ssm_parameter.ecs_optimized_ami.value
  instance_type = each.value.instance_type

  security_groups                 = ["sg-0a0c62f544cbbb21d"]
  user_data                       = base64encode(each.value.user_data)
  ignore_desired_capacity_changes = true

  create_iam_instance_profile = true
  iam_role_name               = local.name
  iam_role_description        = "ECS role for ${local.name}"
  iam_role_policies = {
    AmazonEC2ContainerServiceforEC2Role = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
    AmazonSSMManagedInstanceCore        = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  tag_specifications = [
    {
      resource_type = "instance"
      tags = { 
        AppName = "IaC"
        Example            = local.name
        Backup             = "no"
        BusinessUnit       = "travel.poc"
        DataClassification = "internal"
        Environment        = "poc"
        InfraOwner         = "sre-cloud-reliability@tavisca.com"
        Name               = local.name
        Product            = "poap"
        Repository = "https://github.com/terraform-aws-modules/terraform-aws-ecs" }
    },
    {
      resource_type = "volume"
      tags = { 
        AppName = "IaC"
        Example            = local.name
        Backup             = "no"
        BusinessUnit       = "travel.poc"
        DataClassification = "internal"
        Environment        = "poc"
        InfraOwner         = "sre-cloud-reliability@tavisca.com"
        Name               = local.name
        Product            = "poap"
        Repository = "https://github.com/terraform-aws-modules/terraform-aws-ecs" }
    },
    {
      resource_type = "network-interface"
      tags = { 
        AppName = "IaC"
        Example            = local.name
        Backup             = "no"
        BusinessUnit       = "travel.poc"
        DataClassification = "internal"
        Environment        = "poc"
        InfraOwner         = "sre-cloud-reliability@tavisca.com"
        Name               = local.name
        Product            = "poap"
        Repository = "https://github.com/terraform-aws-modules/terraform-aws-ecs" }
    }
  ]

  vpc_zone_identifier = ["subnet-01d4d19deaa34db85", "subnet-061e332b24aecd27b", "subnet-060048463710e54c4"]
  health_check_type   = "EC2"
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1

  # https://github.com/hashicorp/terraform-provider-aws/issues/12582
  autoscaling_group_tags = {
    AmazonECSManaged   = true
    AppName            = "IaC"
    Example            = local.name
    Backup             = "no"
    BusinessUnit       = "travel.poc"
    DataClassification = "internal"
    Environment        = "poc"
    InfraOwner         = "sre-cloud-reliability@tavisca.com"
    Name               = local.name
    Product            = "poap"
    Repository         = "https://github.com/terraform-aws-modules/terraform-aws-ecs"
  }

  # Required for  managed_termination_protection = "ENABLED"
  protect_from_scale_in = true

  # Spot instances
  use_mixed_instances_policy = each.value.use_mixed_instances_policy
  mixed_instances_policy     = each.value.mixed_instances_policy
  update_default_version = each.value.update_default_version
  tags = local.tags
}

# module "autoscaling_sg" {
#   source  = "terraform-aws-modules/security-group/aws"
#   version = "~> 5.0"

#   name        = local.name
#   description = "Autoscaling group security group"
#   vpc_id      = module.vpc.vpc_id

#   computed_ingress_with_source_security_group_id = [
#     {
#       rule                     = "http-80-tcp"
#       source_security_group_id = module.alb.security_group_id
#     }
#   ]
#   number_of_computed_ingress_with_source_security_group_id = 1

#   egress_rules = ["all-all"]

#   tags = local.tags
# }
