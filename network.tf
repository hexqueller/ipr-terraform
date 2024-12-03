resource "openstack_networking_network_v2" "network_1" {
  name           = "network_1"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  name       = "subnet_1"
  network_id = openstack_networking_network_v2.network_1.id
  cidr       = "192.168.199.0/24"
  ip_version = 4
}

resource "openstack_networking_port_v2" "port_1" {
  name           = "port_1"
  network_id     = openstack_networking_network_v2.network_1.id
  admin_state_up = "true"

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_1.id
    ip_address = "192.168.199.10"
  }
}
