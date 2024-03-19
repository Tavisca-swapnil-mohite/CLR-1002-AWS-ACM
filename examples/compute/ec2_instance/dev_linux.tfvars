new_key_pair = true
existing_key_pair = false
key_name = "test_key"

instance_count = 2
ami = "ami-0f403e3180720dd7e"
instance_type = "t2.micro"
#vpc_security_group_ids = ["sg-0ccc3ecc37dd3ab24"]
subnet_id = "subnet-00db9f76b62626373"
root_block_device = [ ]
ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_size  = 1
    
    }
      ]



















