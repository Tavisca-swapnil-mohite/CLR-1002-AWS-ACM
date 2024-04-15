# variables.tfvars

security_group_1_name = "sg1"
security_group_2_name = "sg2"
security_group_3_name = "sg3"

vpc_id = "vpc-0a3e1713729427b65"

ingress_rules_sg1 = [
  {
  #  description    =
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = []
    source_sg_id    = "sg-0a9df339d7281083d"
    self_referencing = false
  },
  {
    from_port       = 22
    to_port         = 22
    protocol        = "udp"
    cidr_blocks     = ["0.0.0.0/0"]
    source_sg_id    = ""
    self_referencing = true
  }
]

egress_rules_sg1 = [
  {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    source_sg_id    = ""
    self_referencing = false
  }
]

ingress_rules_sg2 = [
  {
    from_port       = 8095
    to_port         = 8095
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    source_sg_id    = ""
    self_referencing = false
  }
]

egress_rules_sg2 = [
  {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    source_sg_id    = ""
    self_referencing = false
  }
]

ingress_rules_sg3 = [
  {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    source_sg_id    = ""
    self_referencing = false
  },
  {
    from_port       = 9090
    to_port         = 9090
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    source_sg_id    = ""
    self_referencing = false
  }
]

egress_rules_sg3 = [
  {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    source_sg_id    = ""
    self_referencing = false
  }
]
