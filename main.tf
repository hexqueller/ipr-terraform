resource "selectel_vpc_project_v2" "project_1" {
  name = var.selectel_project_name
}

resource "selectel_iam_serviceuser_v1" "serviceuser_1" {
  name     = var.selectel_project_serviceuser_name
  password = var.selectel_project_serviceuser_pass
  role {
    role_name  = "member"
    scope      = "project"
    project_id = selectel_vpc_project_v2.project_1.id
  }
}

module "image_datasource" {
  source = "./modules/image_datasource"
  depends_on = [
    selectel_vpc_project_v2.project_1,
    selectel_iam_serviceuser_v1.serviceuser_1
  ]
}

module "network" {
  source = "./modules/network"
  depends_on = [
    selectel_vpc_project_v2.project_1,
    selectel_iam_serviceuser_v1.serviceuser_1
  ]
}

resource "openstack_networking_port_v2" "port_1" {
  name       = "eth0"
  network_id = module.network.network_id

  fixed_ip {
    subnet_id = module.network.subnet_id
  }
}

module "webserver" {
  source       = "./modules/vm"
  server_name  = "webserver"
  image_id     = module.image_datasource.image_id
  network_port = openstack_networking_port_v2.port_1.id

  user_data = templatefile("scripts/nginx.sh", {
    network = module.floatingip.floatingip_address
    image   = module.image_datasource.image_id
  })
}

module "floatingip" {
  source = "./modules/floatingip"
  region = var.selectel_region
}

resource "openstack_networking_floatingip_associate_v2" "association_1" {
  port_id     = openstack_networking_port_v2.port_1.id
  floating_ip = module.floatingip.floatingip_address
}
