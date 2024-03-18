variable "vpc_id" {
  description = "The ID of the VPC to create the subnets in"
  type        = string
}
variable "all_layer_subnet_ids" {
  description = "List of all layer's subnet ids [list of pub syub, list of web subnet, , ,]"

}
variable "public_nacl_map" {
  description = "List of rules for PUBLIC NACL"
  default = []
}
variable "app_nacl_map" {
  description = "List of rules for APP NACL"
  default = []
}
variable "web_nacl_map" {
  description = "List of rules for WEB Web"
  default = []
}
variable "data_nacl_map" {
  description = "List of rules for DATA Web"
  default = []  
}
variable "mgmt_nacl_map" {
  description = "List of rules for MGMT Web"
  default = [] 
}