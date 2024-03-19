
vpc_id = "vpc-0a3e1713729427b65"

security_groups = {
  "web" = {
    name        = "web"
    description = "Security group for web servers"

    ingress_rules = [
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
              from_port   = 3389
              to_port     = 3389
              protocol    = "tcp"
              cidr_blocks = ["0.0.0.0/0"]
            }

    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    tags = {
#      Name = "web"`

    }
  },
  "app" = {
    name        = "app"
    description = "Security group for application servers"
    ingress_rules = [
      {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    tags = {
      Name = "app"
    }
  },
  "db" = {
    name        = "db"
    description = "Security group for database servers"
    ingress_rules = [
      {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["192.168.1.0/24"]
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    tags = {
      Name = "db"
    }
  }
}
