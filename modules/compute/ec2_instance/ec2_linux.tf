data "aws_ebs_default_kms_key" "current" {
}

data "aws_kms_key" "current" {
  key_id = data.aws_ebs_default_kms_key.current.key_arn
}


resource "aws_instance" "ec2" {

  ami                  = var.ami
  instance_type        = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  user_data                   = var.user_data
  user_data_base64            = var.user_data_base64
  user_data_replace_on_change = var.user_data_replace_on_change

  key_name             = var.key_name
  iam_instance_profile = var.iam_instance_profile

  ebs_optimized = var.ebs_optimized

  dynamic "root_block_device" {
    for_each = var.root_block_device

    content {
      delete_on_termination = try(root_block_device.value.delete_on_termination, null)
      encrypted             = try(root_block_device.value.encrypted, null)
      iops                  = try(root_block_device.value.iops, null)
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", data.aws_kms_key.current.arn)
      volume_size           = try(root_block_device.value.volume_size, null)
      volume_type           = try(root_block_device.value.volume_type, null)
      throughput            = try(root_block_device.value.throughput, null)
      tags                  = try(root_block_device.value.tags, null)
    }
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device

    content {
      delete_on_termination = try(ebs_block_device.value.delete_on_termination, null)
      device_name           = ebs_block_device.value.device_name
      encrypted            = true
      iops                  = try(ebs_block_device.value.iops, null)
      kms_key_id            = lookup(ebs_block_device.value, "kms_key_id", data.aws_kms_key.current.arn)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = try(ebs_block_device.value.volume_size, null)
      volume_type           = "gp3"
      throughput            = try(ebs_block_device.value.throughput, null)
      tags                  = try(ebs_block_device.value.tags, null)
    }
  }


  dynamic "metadata_options" {
    for_each = length(var.metadata_options) > 0 ? [var.metadata_options] : []

    content {
      http_endpoint               = try(metadata_options.value.http_endpoint, "enabled")
      http_tokens                 = try(metadata_options.value.http_tokens, "optional")
      http_put_response_hop_limit = try(metadata_options.value.http_put_response_hop_limit, 1)
      instance_metadata_tags      = try(metadata_options.value.instance_metadata_tags, null)
    }
  }

  dynamic "network_interface" {
    for_each = var.network_interface

    content {
      device_index          = network_interface.value.device_index
      network_interface_id  = lookup(network_interface.value, "network_interface_id", null)
      delete_on_termination = try(network_interface.value.delete_on_termination, false)
    }
  }

  dynamic "private_dns_name_options" {
    for_each = length(var.private_dns_name_options) > 0 ? [var.private_dns_name_options] : []

    content {
      hostname_type                        = try(private_dns_name_options.value.hostname_type, null)
      enable_resource_name_dns_a_record    = try(private_dns_name_options.value.enable_resource_name_dns_a_record, null)
      enable_resource_name_dns_aaaa_record = try(private_dns_name_options.value.enable_resource_name_dns_aaaa_record, null)
    }
  }


  dynamic "maintenance_options" {
    for_each = length(var.maintenance_options) > 0 ? [var.maintenance_options] : []

    content {
      auto_recovery = try(maintenance_options.value.auto_recovery, null)
    }
  }

  source_dest_check                    = length(var.network_interface) > 0 ? null : var.source_dest_check
  disable_api_termination              = var.disable_api_termination
  disable_api_stop                     = var.disable_api_stop
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  tags        = merge({ "Name" = var.name }, var.instance_tags, var.tags)
  volume_tags = var.enable_volume_tags ? merge({ "Name" = var.name }, var.volume_tags) : null

  timeouts {
      create = try(var.timeouts.create, null)
      update = try(var.timeouts.update, null)
      delete = try(var.timeouts.delete, null)
    }

   lifecycle {
      create_before_destroy = true
    }
}