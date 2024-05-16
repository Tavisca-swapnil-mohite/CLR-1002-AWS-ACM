asg_name = "poap-ecs-ec2"

tags = {
    AppName            = "IaC"
    Example            = "poap-ecs-ec2"
    Backup             = "no"
    BusinessUnit       = "travel.poc"
    DataClassification = "internal"
    Environment        = "poc"
    InfraOwner         = "sre-cloud-reliability@tavisca.com"
    Product            = "poap"
    Repository         = "https://github.com/terraform-aws-modules/terraform-aws-ecs"
  }

ami_id_ssm_param_name = "Golden-AMI-ECS-Amazon2" 
asg_subnet_ids = ["subnet-01d4d19deaa34db85", "subnet-061e332b24aecd27b", "subnet-060048463710e54c4"]
asg_sec_grps = ["sg-0a0c62f544cbbb21d"]
ignore_desired_capacity_changes = true
create_iam_instance_profile = true