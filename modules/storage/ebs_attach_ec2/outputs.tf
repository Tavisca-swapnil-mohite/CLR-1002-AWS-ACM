output "volume_id" {
  value = aws_ebs_volume.ebs_volume[*].id
}
