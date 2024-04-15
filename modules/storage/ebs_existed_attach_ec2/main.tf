
resource "aws_volume_attachment" "ebs_attachment" {

  volume_id= var.volume_id
  device_name= var.device_name
  instance_id= var.instance_id

}
