resource "selectel_vpc_keypair_v2" "keypair_1" {
  name       = "keypair"
  public_key = file("key.pub")
  user_id    = selectel_iam_serviceuser_v1.serviceuser_1.id
}

resource "openstack_compute_flavor_v2" "main-flavor" {
  name  = "main-flavor"
  ram   = "512"
  vcpus = "1"
  disk  = "5"
}

module "image_datasource" {
  source     = "./modules/image_datasource"

  depends_on = [
    selectel_vpc_project_v2.project_1,
    selectel_iam_serviceuser_v1.serviceuser_1
  ]
}

resource "openstack_compute_instance_v2" "webserver" {
  name  = "webserver"
  flavor_id = openstack_compute_flavor_v2.main-flavor.id
  image_id = module.image_datasource.image_id
  key_pair = selectel_vpc_keypair_v2.keypair_1.name

  network {
    port = openstack_networking_port_v2.port_1.id
  }
}
