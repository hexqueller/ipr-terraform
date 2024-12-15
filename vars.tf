variable "selectel_id" {
  type        = string
  description = "Selectel domain number"
}

variable "selectel_serviceuser_name" {
  type = string
}

variable "selectel_serviceuser_pass" {
  type = string
}

variable "selectel_project_name" {
  default = "Master"
  type    = string
}

variable "selectel_project_serviceuser_name" {
  type = string
}

variable "selectel_project_serviceuser_pass" {
  type = string
}

variable "selectel_region" {
  default = "ru-7"
  type    = string
}

variable "selectel_api" {
  default = "https://cloud.api.selcloud.ru/identity/v3"
  type    = string
}
