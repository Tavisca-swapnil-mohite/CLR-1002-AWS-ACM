
locals {

   ebs_volume_size_length  = length(var.ebs_volume_size_list)
   device_name_list_length = length(var.device_name_list)
   instance_id_list_length = length(var.instance_id_list)

  all_lengths_equal = local.ebs_volume_size_length == local.device_name_list_length && local.device_name_list_length == local.instance_id_list_length

}