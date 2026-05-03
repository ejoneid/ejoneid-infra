output "dokploy_server_status" {
  value = hcloud_server.dokploy.status
}

output "dokploy_server_ip" {
  value = hcloud_server.dokploy.ipv4_address
}
