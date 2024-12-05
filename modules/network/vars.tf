variable "network_name" {
  default = "private-network"
}

variable "subnet_cidr" {
  default = "192.168.0.0/24"
}

variable "enable_dhcp" {
  default = false
}
