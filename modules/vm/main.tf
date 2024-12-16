resource "openstack_compute_flavor_v2" "flavor" {
  name  = var.flavor_name
  vcpus = var.cpu
  ram   = var.ram
  disk  = var.disk
}

resource "openstack_compute_instance_v2" "vps" {
  name      = var.server_name
  flavor_id = openstack_compute_flavor_v2.flavor.id
  image_id  = var.image_id
  user_data = var.user_data

  network {
    port = var.network_port
  }
  vendor_options {
    ignore_resize_confirmation = true
  }
}
