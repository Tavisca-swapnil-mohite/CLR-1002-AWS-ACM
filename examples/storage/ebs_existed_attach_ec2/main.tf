module "ebs_volume" {
  source           = "../../../modules/storage/ebs_existed_attach_ec2"


   count          = var.ebs_volume_attach_count

  volume_id         = var.volume_id_attach_list["${count.index}"]
  device_name       = var.device_name_attach_list["${count.index}"]
  instance_id       = var.instance_id_attach_list["${count.index}"]

}