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

module "vps" {
  source = "./modules/vm"

  server_name  = "webserver"
  image_id     = module.image_datasource.image_id
  user_data    = file("scripts/nginx.sh")
  network_port = module.network.port
}
