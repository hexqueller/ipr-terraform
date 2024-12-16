resource "random_id" "flavor_id" {
  keepers = {
    name  = var.server_name
    vcpus = var.cpu
    ram   = var.ram
    disk  = var.disk
  }
  byte_length = 4
}

resource "openstack_compute_flavor_v2" "flavor" {
  name  = "flavor-${random_id.flavor_id.hex}"
  vcpus = var.cpu
  ram   = var.ram
  disk  = var.disk

  lifecycle {
    create_before_destroy = true
  }
}

resource "openstack_compute_instance_v2" "vps" {
  name      = var.server_name
  flavor_id = openstack_compute_flavor_v2.flavor.id
  image_id  = var.image_id
  user_data = var.user_data

  network {
    port = var.network_port
  }
}
