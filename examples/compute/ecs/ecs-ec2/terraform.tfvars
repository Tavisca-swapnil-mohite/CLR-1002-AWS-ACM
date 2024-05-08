## Cluster variables
cluster_name = "poap-ecs-ec2"
service_name = "poap-ecs-ec2-service"
default_capacity_provider_use_fargate  = false

tags = {
    AppName            = "IaC"
    Example            = "poap-ecs-ec2"
    Backup             = "no"
    BusinessUnit       = "travel.poc"
    DataClassification = "internal"
    Environment        = "poc"
    InfraOwner         = "sre-cloud-reliability@tavisca.com"
    Name               = "poap-ecs-ec2"
    Product            = "poap"
    Repository         = "https://github.com/terraform-aws-modules/terraform-aws-ecs"
  }

### Service
requires_compatibilities = ["EC2"]
volume = {
    my-vol = {}
}
service_subnet_ids = ["subnet-002941839df299385","subnet-049259e3ca3abb796","subnet-0b73c87fb85148612"]

## Container Definition
container_name = "ecs-sample-v1"
memory = 512

## Supporting variables
alb_subnets = ["subnet-087e26662cb4bd1bf","subnet-0f8286674a683055f","subnet-076d3e2544aa1f33e"]
vpc_id = "vpc-0d498bf0d4918a34c"
vpc_cidr_block = "10.0.0.0/16"
