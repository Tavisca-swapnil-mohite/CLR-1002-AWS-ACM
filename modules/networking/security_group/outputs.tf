output "security_group_id" {
  value = { for sg_name, sg in aws_security_group.security_group : sg_name => sg.id }
}