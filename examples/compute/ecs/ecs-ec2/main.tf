provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}


################################################################################
# Cluster
################################################################################

module "ecs_cluster" {
  source = "../../../../modules/compute/ecs/cluster" 
  cluster_name = var.cluster_name

  # Capacity provider - autoscaling groups
  default_capacity_provider_use_fargate = var.default_capacity_provider_use_fargate
  autoscaling_capacity_providers = {
    # On-demand instances
    ex_1 = {
      auto_scaling_group_arn         = module.autoscaling["ex_1"].autoscaling_group_arn
      managed_termination_protection = "ENABLED"
      managed_scaling = {
        maximum_scaling_step_size = 5
        minimum_scaling_step_size = 1
        status                    = "ENABLED"
        target_capacity           = 60
      }

      default_capacity_provider_strategy = {
        weight = 60
        base   = 20
      }
    }
  }

  tags = local.tags
}

################################################################################
# Service
################################################################################

module "ecs_service" {
  source = "../../../../modules/compute/ecs/service"

  # Service
  name        = var.service_name
  cluster_arn = module.ecs_cluster.arn

  # Task Definition
  requires_compatibilities = var.requires_compatibilities
  capacity_provider_strategy = {
    # On-demand instances
    ex_1 = {
      capacity_provider = module.ecs_cluster.autoscaling_capacity_providers["ex_1"].name
      weight            = 1
      base              = 1
    }
  }

  volume = var.volume

  # Container definition(s)
  container_definitions = var.container_definitions

  load_balancer = {
    service = {
      target_group_arn = module.alb.target_groups["ex_ecs"].arn
      container_name   = local.container_name
      container_port   = local.container_port
      hostPort         = 80
    }
  }
  memory = var.memory

  subnet_ids = var.service_subnet_ids
  security_group_rules = {
    alb_http_ingress = {
      type                     = "ingress"
      from_port                = local.container_port
      to_port                  = local.container_port
      protocol                 = "tcp"
      description              = "Service port"
      source_security_group_id = module.alb.security_group_id
    }
  }

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#ecs-optimized-ami-linux
data "aws_ssm_parameter" "ecs_optimized_ami" {
  name = "Golden-AMI-ECS-Amazon2"
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"

  name = var.cluster_name

  load_balancer_type = "application"

  vpc_id  = var.vpc_id
  subnets = var.alb_subnets

  # For example only
  enable_deletion_protection = false

  # Security Group
  security_group_ingress_rules = {
    all_http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
  security_group_egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = var.vpc_cidr_block
    }
  }

  listeners = {
    ex_http = {
      port     = 80
      protocol = "HTTP"

      forward = {
        target_group_key = "ex_ecs"
      }
    }
  }

  target_groups = {
    ex_ecs = {
      backend_protocol                  = "HTTP"
      backend_port                      = local.container_port
      target_type                       = "ip"
      deregistration_delay              = 5
      load_balancing_cross_zone_enabled = true

      health_check = {
        enabled             = true
        healthy_threshold   = 5
        interval            = 30
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = 5
        unhealthy_threshold = 2
      }

      # Theres nothing to attach here in this definition. Instead,
      # ECS will attach the IPs of the tasks to this target group
      create_attachment = false
    }
  }

  tags = local.tags
}

module "autoscaling" {
  source  = "../../../../modules/compute/ec2_asg"
  

  for_each = {
    # On-demand instances
    ex_1 = {
      instance_type              = "t3.large"
      use_mixed_instances_policy = false
      update_default_version      = true
      mixed_instances_policy     = {}
      user_data                  = <<-EOT
        #!/bin/bash
        cat <<'EOF' >> /etc/ecs/ecs.config
        ECS_CLUSTER=${var.cluster_name}
        ECS_LOGLEVEL=debug
        ECS_CONTAINER_INSTANCE_TAGS=${jsonencode(local.tags)}
        ECS_ENABLE_TASK_IAM_ROLE=true
        EOF
      EOT
    }
  }


  name = "${var.cluster_name}-${each.key}"
  force_delete = true
  image_id      = data.aws_ssm_parameter.ecs_optimized_ami.value
  instance_type = each.value.instance_type

  security_groups                 = [module.autoscaling_sg.security_group_id]
  user_data                       = base64encode(each.value.user_data)
  ignore_desired_capacity_changes = true

  create_iam_instance_profile = true
  iam_role_name               = var.cluster_name
  iam_role_description        = "ECS role for ${var.cluster_name}"
  iam_role_policies = {
    AmazonEC2ContainerServiceforEC2Role = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
    AmazonSSMManagedInstanceCore        = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  tag_specifications = [
    {
      resource_type = "instance"
      tags = var.tags
    },
    {
      resource_type = "volume"
      tags = var.tags
    },
    {
      resource_type = "network-interface"
      tags = var.tags
    }
  ]

  vpc_zone_identifier = var.service_subnet_ids
  health_check_type   = "EC2"
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1

  # https://github.com/hashicorp/terraform-provider-aws/issues/12582
  autoscaling_group_tags = var.tags

  # Required for  managed_termination_protection = "ENABLED"
  protect_from_scale_in = true

  # Spot instances
  use_mixed_instances_policy = each.value.use_mixed_instances_policy
  mixed_instances_policy     = each.value.mixed_instances_policy
  update_default_version = each.value.update_default_version
  tags = local.tags
}

module "autoscaling_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = var.cluster_name
  description = "Autoscaling group security group"
  vpc_id      = var.vpc_id

  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = module.alb.security_group_id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1

  egress_rules = ["all-all"]

  tags = local.tags
}
