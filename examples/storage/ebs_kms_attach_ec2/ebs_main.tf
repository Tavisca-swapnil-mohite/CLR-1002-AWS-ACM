module "ebs_volume" {
   source           = "../../../modules/storage/ebs_with_kms"

  count          = var.ebs_volume_count

  default_kms_key = var.default_kms_key

  volume_size      = var.ebs_volume_size_list["${count.index}"]
  availability_zone = var.ebs_availability_zone
  snapshot_id      = var.snapshot_id
  iops              = var.iops
 # kms_key_id        = var.kms_key_id
  final_snapshot    = var.final_snapshot
  multi_attach_enabled = var.multi_attach_enabled

  tags             = var.tags

  device_name       = var.device_name_list["${count.index}"]
  instance_id       = var.instance_id_list["${count.index}"]


  }