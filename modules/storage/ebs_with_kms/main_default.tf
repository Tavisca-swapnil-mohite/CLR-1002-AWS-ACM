
data "aws_ebs_default_kms_key" "current" {
}

data "aws_kms_key" "current" {
  key_id = data.aws_ebs_default_kms_key.current.key_arn
}


resource "aws_ebs_volume" "ebs_volume" {

  availability_zone = var.availability_zone
  type              = local.ebs_type
  size              = var.volume_size
  iops              = var.iops
  encrypted         = local.ebs_encrypted
  #below line indicates if nothing mentioned, it will take default kms mentioned above datablock
  kms_key_id = var.custom_kms_key_id != "" ? var.custom_kms_key_id : data.aws_kms_key.current.arn
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
