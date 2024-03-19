output "volume_ids" {
 value = module.ebs_volume[*].volume_id

}