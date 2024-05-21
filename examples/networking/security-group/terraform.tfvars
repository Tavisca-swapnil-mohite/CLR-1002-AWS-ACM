sg_configs = {
  sg1 = {
    name = "iac-security-group-1"
    description = "Test IAC Security Group 1"
    vpc_id = "vpc-07b12bcec12a4cd9b"
    ingress_rules = [
      {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = []
        security_groups    = ["sg-02dfd3936c47a6a7c"]
        self = false
      },
      {
        from_port       = 22
        to_port         = 22
        protocol        = "udp"
        cidr_blocks     = ["10.238.32.0/20"]
        security_groups    = []
        self = true
      }
    ]
    egress_rules = [
      {
        from_port       = 0
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = ["10.238.32.0/20"]
        security_groups    = []
        self = false
      }
    ]
  }

  sg2 = {
    name = "iac-security-group-2"
    description = "Test IAC Security Group 2"
    vpc_id = "vpc-07b12bcec12a4cd9b"
    ingress_rules = [
      {
        from_port       = 8095
        to_port         = 8095
        protocol        = "tcp"
        cidr_blocks     = ["10.238.32.0/20"]
        security_groups    = []
        self = false
      }
    ]
    egress_rules = [
      {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["10.238.32.0/20"]
        security_groups    = []
        self = false
      }
    ]
  }

  sg3 = {
    name = "iac-security-group-3"
    description = "Test IAC Security Group 3"
    vpc_id = "vpc-07b12bcec12a4cd9b"
    ingress_rules = [
      {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["10.238.32.0/20"]
        security_groups    = []
        self = false
      },
      {
        from_port       = 9090
        to_port         = 9090
        protocol        = "tcp"
        cidr_blocks     = ["10.238.32.0/20"]
        security_groups    = []
        self = false
      }
    ]
    egress_rules = [
      {
        from_port       = 0
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = ["10.238.32.0/20"]
        security_groups    = []
        self = false
      }
    ]
  }
}