##################################################################################
# VARIABLES
##################################################################################

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {} 
variable "username"  {}
variable "password"  {}
variable "custom_image_name"{}
variable "custom_image_resource_group_name" {}
variable "instance_count" {}
variable "instance_size" {}
variable "subnet_count" {
  default =1
}
variable "network_address_space" {}
variable  "prefix" {
  default = "Terraform"
}
variable  "protocols"{
  type = "list"
  default= ["HTTP","SSH"]
}
variable  "ports"{
  type = "list"
  default= ["80","22"]
}
variable "tags"{
  type = map(string)
}
