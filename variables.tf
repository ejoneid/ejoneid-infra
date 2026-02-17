
variable "hcloud_token" {}
variable "s3_access_key" {}
variable "s3_secret_key" {}

variable "location" {
  default = "hel1"
}

variable "server_type" {
  default = "cax21"
}

variable "dokploy_server_type" {
  default = "cx23"
}

variable "os_type" {
  default = "ubuntu-24.04"
}

variable "coolify_server_id" {}
variable "ejoneid_zone_id" {}
