new_key_pair = true
existing_key_pair = false
key_name = "test_key"


#instance_count = 3
spot_instance_count = 1
ami = "ami-0f403e3180720dd7e"
instance_type = "t2.micro"
vpc_security_group_ids = ["sg-001813a89cf5fca03"]
subnet_id = "subnet-0f8f0226e8d053595"

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



















