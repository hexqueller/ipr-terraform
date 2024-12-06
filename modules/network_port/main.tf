resource "openstack_networking_port_v2" "port_1" {
  name       = var.port_name
  network_id = var.network_id
  fixed_ip {
    subnet_id = var.subnet_id
  }
}
