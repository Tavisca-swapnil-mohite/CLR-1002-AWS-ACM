data "aws_availability_zones" "available" {}

locals {
  region = "us-east-1"
  name   = var.asg_name

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  container_name = "ecs-sample"
  container_port = 80

  tags = var.tags
}


module "autoscaling" {
  source  = "../../../modules/compute/ec2_asg"
  

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

  image_id      = var.ami_id_ssm_param_name
  instance_type = each.value.instance_type

  security_groups                 = var.asg_sec_grps
  user_data                       = base64encode(each.value.user_data)
  ignore_desired_capacity_changes = var.ignore_desired_capacity_changes

  create_iam_instance_profile = var.create_iam_instance_profile
  iam_role_name               = local.name
  iam_role_description        = "ECS role for ${local.name}"
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

  vpc_zone_identifier = var.asg_subnet_ids
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
