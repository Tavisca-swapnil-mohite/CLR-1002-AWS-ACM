output "id" {
  description = "The ID of the instance"
  value = aws_instance.ec2.id
}

output "arn" {
  description = "The ARN of the instance"
  value = try(
    aws_instance.ec2.arn,
    null,
  )
}

output "capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value = try(
    aws_instance.ec2.capacity_reservation_specification,

    null,
  )
}

output "instance_state" {
  description = "The state of the instance"
  value = try(
    aws_instance.ec2.instance_state,

    null,
  )
}

output "outpost_arn" {
  description = "The ARN of the Outpost the instance is assigned to"
  value = try(
    aws_instance.ec2.outpost_arn,

    null,
  )
}


output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value = try(
    aws_instance.ec2.primary_network_interface_id,

    null,
  )
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value = try(
    aws_instance.ec2.private_dns,

    null,
  )
}

output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, ec2_spot is only available if you've enabled DNS hostnames for your VPC"
  value = try(
    aws_instance.ec2.public_dns,

    null,
  )
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as ec2_spot field will change after the EIP is attached"
  value = try(
    aws_instance.ec2.public_ip,

    null,
  )
}

output "private_ip" {
  description = "The private IP address assigned to the instance"
  value = try(
    aws_instance.ec2.private_ip,

    null,
  )
}


output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value = try(
    aws_instance.ec2.tags_all,

    {},
  )
}


output "ami" {
  description = "AMI ID that was used to create the instance"
  value = try(
    aws_instance.ec2.ami,

    null,
  )
}

output "availability_zone" {
  description = "The availability zone of the created instance"
  value = try(
    aws_instance.ec2.availability_zone,

    null,
  )
}

output "root_block_device" {
  description = "Root block device information"
  value = try(
    aws_instance.ec2.root_block_device,

    null
  )
}

output "ebs_block_device" {
  description = "EBS block device information"
  value = try(
    aws_instance.ec2.ebs_block_device,

    null
  )
}

output "ephemeral_block_device" {
  description = "Ephemeral block device information"
  value = try(
    aws_instance.ec2.ephemeral_block_device,

    null
  )
}
