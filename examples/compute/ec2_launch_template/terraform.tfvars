aws_region = "us-east-1"
instance_type = "t3.large"
ebs_volume_details = [
    {
        device_name = "/dev/xvde"
        volume_size = 1000
        delete_on_termination = true
        volume_type = "gp3"
    }
]
instance_iam_role = "cassandra-ec2-role"
key_name = "poc-keypair"
vpc_subnet_ids = ["subnet-01d4d19deaa34db85", "subnet-061e332b24aecd27b", "subnet-060048463710e54c4"]
security_group_ids = ["sg-0a0c62f544cbbb21d"]
termination_protection = false
stop_protection = false

metadata_http_put_response_hop_limit = 1
instance_metadata_tags = null

capacity_reservation_preference = {
    capacity_reservation_preference = null
    capacity_reservation_target = {
      capacity_reservation_id = null
      capacity_reservation_resource_group_arn = null
    }
  }

tag_product = "poap"
tag_appname = "IaC"
tag_infraowner = "sre-cloud-reliability@tavisca.com"
tag_environment = "poc"
tag_backup = "no"
tag_businessunit = "travel.poc"
tag_dataclassification = "internal"


chef_env_name = "test_env"
seednode_ssm_param_name = "seednode_parameter_name"
isprimary_ssm_param_name = "isprime_parameter_name"

# ASG Vars
asg_name = "iac-test-asg"
asg_max_size = 1
asg_min_size = 1
asg_desired_capacity = 1