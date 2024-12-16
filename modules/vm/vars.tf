variable "flavor_name" {
  default = "flavor"
}

variable "server_name" {
  default = "vps"
}

variable "cpu" {
  default = "1"
}

variable "ram" {
  default = "512"
}

variable "disk" {
  default = "5"
}

variable "image_id" {}

variable "user_data" {}

variable "network_port" {}
