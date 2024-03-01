 
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
 


  name                    = var.name
  ami                     = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = false
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  root_block_device = [{
    volume_size           = 10 
    volume_type           = "gp3"
           }   
    ]
  tags = var.tags

}




