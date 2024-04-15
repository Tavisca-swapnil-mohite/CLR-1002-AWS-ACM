
 locals {
   mandate_tags = {
     Product= "plt"
     InfraOwner= "sre-cloud-reliability@tavisca.com"
   }
    module_names = {
        ec2 = "ec2"
        vpc = "vpc"
        sg   = "sg" 
        ebs  = "ebs"  
   }

 }
 variable "org_standards_tags" {
  type        = map(string)
  default     = {Backup = "no",DataClassification = "internal"}
}
