resource "aws_kms_key" "ebs_encryption_key" {
  count = var.custom_kms_key ? 1 : 0

  description      = "KMS key for EBS volume encryption"
  deletion_window_in_days = 7
  enable_key_rotation                = var.enable_key_rotation

}

resource "aws_ebs_volume" "ebs_volume_custom" {
  count = var.custom_kms_key ? 1 : 0

  availability_zone = var.availability_zone
  type              = local.ebs_type
  size              = var.volume_size
  iops              = var.iops
  encrypted         = local.ebs_encrypted
  kms_key_id       = aws_kms_key.ebs_encryption_key[0].arn
# kms_key_id        = var.kms_key_id
  snapshot_id       = var.snapshot_id
  final_snapshot    = var.final_snapshot
  multi_attach_enabled  = var.multi_attach_enabled
  tags                = var.tags

}

resource "aws_volume_attachment" "ebs_attachment_custom" {
  count = var.custom_kms_key ? 1 : 0

  volume_id= aws_ebs_volume.ebs_volume_custom[0].id
  device_name= var.device_name
  instance_id= var.instance_id

}