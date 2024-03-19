#instance_count = 3
windows_instance_count = 1
ami = "ami-0f9c44e98edf38a2b"
instance_type = "t2.micro"
key_name = "test_new_1"
associate_public_ip_address = true

vpc_security_group_ids = ["sg-0ddc03322e44152f6","sg-0b41d325e2f2b1b75"]
subnet_id = "subnet-00db9f76b62626373"

#adding new ebs volumes directly to ec2 while creation of ec2
root_block_device = [
{

      volume_size = 35


    }

]
ebs_block_device = [
    {

      device_name = "xvdb"
      volume_size  = 2
    
    }
      ]



















