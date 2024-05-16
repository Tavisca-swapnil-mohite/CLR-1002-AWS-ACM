module "lt_example" {
  source = "../../../modules/compute/ec2_launch_template"

    instance_type = var.instance_type
    ebs_volume_details = var.ebs_volume_details
    instance_iam_role = var.instance_iam_role
    ami_id_ssm_param_name = var.ami_id_ssm_param_name
    key_name = var.key_name
    vpc_subnet_ids = var.vpc_subnet_ids
    security_group_ids = var.security_group_ids
    termination_protection = var.termination_protection
    stop_protection = var.stop_protection
    ebs_optimized = var.ebs_optimized

    userdata = base64encode(local.userdata)

    metadata_http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
    instance_metadata_tags = var.instance_metadata_tags

    tag_product = var.tag_product
    tag_appname = var.tag_appname
    tag_infraowner = var.tag_infraowner
    tag_environment = var.tag_environment
    tag_backup = var.tag_backup
    tag_businessunit = var.tag_businessunit
    tag_dataclassification = var.tag_dataclassification
}