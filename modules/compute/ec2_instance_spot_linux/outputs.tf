output "id" {
  description = "The ID of the instance"
  value = try(
    aws_spot_instance_request.ec2_spot.id,
    null,
  )
}

output "arn" {
  description = "The ARN of the instance"
  value = try(
    aws_spot_instance_request.ec2_spot.arn,
    null,
  )
}

output "capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value = try(
    aws_spot_instance_request.ec2_spot.capacity_reservation_specification,
    null,
  )
}

output "instance_state" {
  description = "The state of the instance"
  value = try(
    aws_spot_instance_request.ec2_spot.instance_state,
    null,
  )
}

output "outpost_arn" {
  description = "The ARN of the Outpost the instance is assigned to"
  value = try(
    aws_spot_instance_request.ec2_spot.outpost_arn,
    null,
  )
}



output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value = try(

    aws_spot_instance_request.ec2_spot.primary_network_interface_id,
    null,
  )
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value = try(
    aws_spot_instance_request.ec2_spot.private_dns,
    null,
  )
}

output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value = try(
    null,
  )
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value = try(

    aws_spot_instance_request.ec2_spot.public_ip,
    null,
  )
}

output "private_ip" {
  description = "The private IP address assigned to the instance"
  value = try(

    aws_spot_instance_request.ec2_spot.private_ip,
    null,
  )
}

output "ipv6_addresses" {
  description = "The IPv6 address assigned to the instance, if applicable"
  value = try(
    aws_spot_instance_request.ec2_spot.ipv6_addresses,
    [],
  )
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value = try(

    aws_spot_instance_request.ec2_spot.tags_all,
    {},
  )
}

output "spot_bid_status" {
  description = "The current bid status of the Spot Instance Request"
  value       = try(aws_spot_instance_request.ec2_spot.spot_bid_status, null)
}

output "spot_request_state" {
  description = "The current request state of the Spot Instance Request"
  value       = try(aws_spot_instance_request.ec2_spot.spot_request_state, null)
}

output "spot_instance_id" {
  description = "The Instance ID (if any) that is currently fulfilling the Spot Instance request"
  value       = try(aws_spot_instance_request.ec2_spot.spot_instance_id, null)
}

output "ami" {
  description = "AMI ID that was used to create the instance"
  value = try(

    aws_spot_instance_request.ec2_spot.ami,
    null,
  )
}

output "availability_zone" {
  description = "The availability zone of the created instance"
  value = try(

    aws_spot_instance_request.ec2_spot.availability_zone,
    null,
  )
}

################################################################################
# Block Devices
################################################################################
output "root_block_device" {
  description = "Root block device information"
  value = try(

    aws_spot_instance_request.ec2_spot.root_block_device,
    null
  )
}

output "ebs_block_device" {
  description = "EBS block device information"
  value = try(

    aws_spot_instance_request.ec2_spot.ebs_block_device,
    null
  )
}

output "ephemeral_block_device" {
  description = "Ephemeral block device information"
  value = try(
    aws_spot_instance_request.ec2_spot.ephemeral_block_device,
    null
  )
}
