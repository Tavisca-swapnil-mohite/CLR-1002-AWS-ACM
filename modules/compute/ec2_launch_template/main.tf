data "aws_ssm_parameter" "ami" {
  name = var.ami_id_ssm_param_name
}

data "aws_ebs_default_kms_key" "current" {
}

data "aws_kms_key" "current" {
  key_id = data.aws_ebs_default_kms_key.current.key_arn
}

resource "aws_launch_template" "launch_template" {
  name_prefix   = "${var.tag_product}.${var.tag_appname}"
  image_id      = data.aws_ssm_parameter.ami.value
  instance_type = var.instance_type
  key_name = var.key_name
  disable_api_termination = var.termination_protection
  disable_api_stop = var.stop_protection
  ebs_optimized = var.ebs_optimized
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  kernel_id = var.kernel_id

  vpc_security_group_ids = var.security_group_ids

  user_data = var.userdata

  tags = {
    Name = "${var.tag_product}.${var.tag_appname}-lt"
    Environment = var.tag_environment
    Product = var.tag_product
    AppName = var.tag_appname
    Backup = var.tag_backup
    BusinessUnit = var.tag_businessunit
    InfraOwner = var.tag_infraowner
    DataClassification = var.tag_dataclassification
  }

  dynamic tag_specifications {
    for_each = [
        {resource_type = "instance", tag_postfix = "instance"},
        {resource_type = "volume", tag_postfix = "ebs"},
        {resource_type = "network-interface", tag_postfix = "eni"}
    ]

    content {
        resource_type = tag_specifications.value.resource_type
        tags = {
            Name = "${var.tag_product}.${var.tag_appname}-${tag_specifications.value.tag_postfix}"
            Environment = var.tag_environment
            Product = var.tag_product
            AppName = var.tag_appname
            Backup = var.tag_backup
            BusinessUnit = var.tag_businessunit
            InfraOwner = var.tag_infraowner
            DataClassification = var.tag_dataclassification
        }
      
    }
  }
  # metadata_options {
  #   http_endpoint = "enabled"
  #   http_tokens = "required"
  #   # http_put_response_hop_limit = try(var.metadata_http_put_response_hop_limit, 1)
  #   # instance_metadata_tags      = try(var.instance_metadata_tags, null)
  # }

  dynamic "block_device_mappings" {
    for_each = var.ebs_volume_details
    content {
      device_name = block_device_mappings.value.device_name
      ebs {
        volume_size = try(block_device_mappings.value.volume_size, null)
        volume_type = try(block_device_mappings.value.volume_type, null)
        delete_on_termination = try(block_device_mappings.value.delete_on_termination, null)
        encrypted = true
        iops = try(block_device_mappings.value.iops, null)
        kms_key_id = lookup(block_device_mappings.value, "kms_key_id", data.aws_kms_key.current.arn)
        snapshot_id = try(block_device_mappings.value.snapshot_id, null)
        throughput = try(block_device_mappings.value.throughput, null)
    }
    }
  }

  dynamic "capacity_reservation_specification" {
    for_each = var.capacity_reservation_specification != null ? [var.capacity_reservation_specification] : []
    content {
      capacity_reservation_preference = try(capacity_reservation_specification.value.capacity_reservation_preference, null)

      dynamic "capacity_reservation_target" {
        for_each = contains(capacity_reservation_specification.value, "capacity_reservation_target") ? [capacity_reservation_specification.capacity_reservation_target] : []
        content {
            capacity_reservation_id = capacity_reservation_target.capacity_reservation_id
            capacity_reservation_resource_group_arn = capacity_reservation_target.capacity_reservation_resource_group_arn
        }
      }
    }
  }

  dynamic "iam_instance_profile" {
    for_each = var.instance_iam_role != null ? [1] : []
    content {
      name = var.instance_iam_role
    }
  }

  dynamic "cpu_options" {
    for_each = var.cpu_options != null ? [var.cpu_options] : []
    content {
      core_count = try(cpu_options.value.core_count, null)
      threads_per_core = try(cpu_options.value.threads_per_core, null)
    }
  }

  dynamic "credit_specification" {
    for_each = var.credit_specification_cpu_credits != null ? [1] : []

    content {
      cpu_credits = try(var.credit_specification_cpu_credits, null)
    }
  }

  dynamic "elastic_gpu_specifications" {
    for_each = var.elastic_gpu_type != null ? [1]: []

    content {
      type = var.elastic_gpu_type
    }
  }

  dynamic "elastic_inference_accelerator" {
    for_each = var.elastic_inference_accelerator_type != null ? [1]: []

    content {
      type = var.elastic_inference_accelerator_type
    }
  }

  dynamic "hibernation_options" {
    for_each = var.enable_hibernation == true ? [1]: []

    content {
      configured = var.enable_hibernation
    }
  }

  dynamic "license_specification" {
    for_each = var.license_configuration_arn != null ? [1]: []

    content {
      license_configuration_arn = var.license_configuration_arn
    }
  }

  dynamic "monitoring" {
    for_each = var.monitoring == true ? [1]: []

    content {
      enabled  = var.monitoring
    }
  }
}