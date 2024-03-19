data "aws_partition" "current" {}

locals {


  is_t_instance_type = replace(var.instance_type, "/^t(2|3|3a|4g){1}\\..*$/", "1") == "1" ? true : false

  ami = try(coalesce(var.ami, try(nonsensitive(data.aws_ssm_parameter.ec2_windows[0].value), null)), null)
}

data "aws_ssm_parameter" "ec2_windows" {
  count = var.ami == null ? 1 : 0

  name = var.ami_ssm_parameter
}
