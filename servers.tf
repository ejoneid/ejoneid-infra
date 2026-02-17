resource "hcloud_server" "coolify" {
  name               = "ejoneid-coolify-server"
  image              = var.os_type
  server_type        = var.server_type
  location           = var.location
  delete_protection  = true
  rebuild_protection = true
  labels = {
    type = "web"
  }
}

resource "hcloud_server" "dokploy" {
  name               = "ejoneid-dokploy-server"
  image              = var.os_type
  server_type        = var.dokploy_server_type
  location           = var.location
  delete_protection  = false
  rebuild_protection = false
  ssh_keys           = [hcloud_ssh_key.default.id]
  labels = {
    type = "web"
  }
  user_data = templatefile("user_data.yml.tftpl", {
    ssh_public_key = file(pathexpand("~/.ssh/ejoneid_devops.pub"))
  })
}
