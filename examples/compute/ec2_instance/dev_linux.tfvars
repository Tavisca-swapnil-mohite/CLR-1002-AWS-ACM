new_key_pair = true
existing_key_pair = false
key_name = "key1"

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
      kms_key_id = "arn:aws:kms:us-east-1:796936741154:key/76a060bf-e449-4b65-b87f-6c778c3db909"
    },
    {
          device_name = "/dev/xvdf"
          volume_size  = 3

        }

      ]



















