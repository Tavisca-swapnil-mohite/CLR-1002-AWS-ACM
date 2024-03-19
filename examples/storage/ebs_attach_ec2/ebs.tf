
module "ebs_volume" {
  source           = "../../../modules/storage/ebs_attach_ec2"

  count          = var.ebs_volume_count

 
  volume_size      = var.ebs_volume_size_list["${count.index}"]
  availability_zone = var.ebs_availability_zone
  snapshot_id      = var.snapshot_id
  iops              = var.iops
  encrypted         = var.encrypted
  final_snapshot    = var.final_snapshot
  multi_attach_enabled = var.multi_attach_enabled

  tags             = var.tags


  device_name       = var.device_name_list["${count.index}"]
  instance_id       = var.instance_id_list["${count.index}"]


  }