
resource "aws_ebs_volume" "ebs_volume" {

  availability_zone = var.availability_zone
  type              = var.type
  size              = var.volume_size
  iops              = var.iops
  encrypted         = var.encrypted
  snapshot_id       = var.snapshot_id
  final_snapshot    = var.final_snapshot
  multi_attach_enabled  = var.multi_attach_enabled
  tags                = var.tags

  
}

resource "aws_volume_attachment" "ebs_attachment" {

  volume_id= aws_ebs_volume.ebs_volume.id
  device_name= var.device_name
  instance_id= var.instance_id

}
