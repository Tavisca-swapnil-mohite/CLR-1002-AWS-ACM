## Cluster variables
cluster_name = "poap-ecs-ec2"
service_name = "poap-ecs-ec2-service"
default_capacity_provider_use_fargate  = false

tags = {
    AppName            = "IaC"
    Example            = local.name
    Backup             = "no"
    BusinessUnit       = "travel.poc"
    DataClassification = "internal"
    Environment        = "poc"
    InfraOwner         = "sre-cloud-reliability@tavisca.com"
    Name               = local.name
    Product            = "poap"
    Repository         = "https://github.com/terraform-aws-modules/terraform-aws-ecs"
  }

### Service
requires_compatibilities = ["EC2"]
volume = {
    my-vol = {}
}

## Container Definition
container_name = "ecs-sample-v1"
memory = 512



