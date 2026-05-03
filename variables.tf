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

variable "container_name" {
  type = set(string)
  default = [ "bronze", "silver", "gold" ]
}
