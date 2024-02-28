 
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"


  name                    = var.name
  ami                     = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = false
  vpc_security_group_ids =  var.security_group_id
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  root_block_device = [{
    volume_size           = 10 
    volume_type           = "gp3"
           }   
    ]
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}




