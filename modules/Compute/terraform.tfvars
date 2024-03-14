environment_tags = {BusinessUnit = "travel.poc",Environment = "poc"}

#############################################################################################
instance_count = 3
ami = "ami-0f403e3180720dd7e"
instance_type = "t2.micro"
vpc_security_group_ids = ["sg-001813a89cf5fca03"]
subnet_id = "subnet-0f8f0226e8d053595"

#creating ebs volumes and adding

ebs_availability_zone = "us-east-1c"
ebs_volume_count = 3
ebs_volume_size_list = ["2","4","6"]

instance_id_list = ["i-0f2caefc9ff420e75","i-0b73598881ad28745", "i-0b73598881ad28745"]
volume_id_list = ["vol-093474de9efb11582","vol-01029b0c52d5e6e4b","vol-0bd5226413ccd425b"]
device_name_list = ["/dev/sdf","/dev/xvdf","/dev/xvdg"]




#adding new ebs volumes directly to ec2 while creation of ec2

ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_size  = 1

    },
    {
      device_name = "/dev/sdg"
      volume_size = 1
    }
      ]


 ###########################################################sg#####################################

 security_groups = {
     web = {
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
     }

     app = {
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
     }
   }
 }
