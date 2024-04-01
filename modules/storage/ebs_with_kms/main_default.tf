/*
data "aws_ebs_default_kms_key" "current1" {
}

data "aws_kms_key" "current" {
  key_id = data.aws_ebs_default_kms_key.current1.key_arn
}
*/

resource "aws_ebs_volume" "ebs_volume" {
  count = var.default_kms_key ? 1 : 0

  availability_zone = var.availability_zone
  type              = local.ebs_type
  size              = var.volume_size
  iops              = var.iops
  encrypted         = local.ebs_encrypted
 #kms_key_id       = data.aws_kms_key.current.arn
  kms_key_id        = var.kms_key_id
  snapshot_id       = var.snapshot_id
  final_snapshot    = var.final_snapshot
  multi_attach_enabled  = var.multi_attach_enabled
  tags                = var.tags
}


resource "aws_volume_attachment" "ebs_attachment" {
  count = var.default_kms_key ? 1 : 0

  volume_id= aws_ebs_volume.ebs_volume[0].id
  device_name= var.device_name
  instance_id= var.instance_id

}
