variable "resource_group_name" {
  type = string
  default = "dev"
}

variable "resource_group_location" {
  type = string
  default = "South India "
}

variable "virtual_network_name" {
  type = string
  default = "dev_vnet"
}

variable "virtual_network_prefix" {
  type = list()
  default = ["10.2.0.0/16"]
}