terraform {
  required_providers {
    selectel = {
      source  = "selectel/selectel"
      version = "5.4.0"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "3.0.0"
    }
  }
}

provider "selectel" {
  domain_name = var.selectel_id
  username    = var.selectel_serviceuser_name
  password    = var.selectel_serviceuser_pass
}

provider "openstack" {
  auth_url    = var.selectel_api
  domain_name = var.selectel_id
  tenant_id   = selectel_vpc_project_v2.project_1.id
  user_name   = selectel_iam_serviceuser_v1.serviceuser_1.name
  password    = selectel_iam_serviceuser_v1.serviceuser_1.password
  region      = var.selectel_region
}
