module "image_datasource" {
  source = "./modules/image_datasource"
  depends_on = [
    selectel_vpc_project_v2.project_1,
    selectel_iam_serviceuser_v1.serviceuser_1
  ]
}

module "network" {
  source = "./modules/network"
}

module "network_port_1" {
  source     = "./modules/network_port"
  network_id = module.network.network_id
  subnet_id  = module.network.subnet_id
}

module "webserver" {
  source       = "./modules/vm"
  server_name  = "webserver"
  image_id     = module.image_datasource.image_id
  network_port = module.network_port_1.port
  user_data = templatefile("scripts/nginx.sh", {
    network = module.network_port_1.port
    image   = module.image_datasource.image_id
  })
}
