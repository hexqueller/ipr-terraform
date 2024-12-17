output "server_ip" {
  value = "http://${module.floatingip.floatingip_address}"
}
