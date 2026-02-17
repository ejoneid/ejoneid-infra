resource "hcloud_zone" "ejoneid_dev" {
  name = "ejoneid.dev"
  mode = "primary"
  ttl  = 3600
}

resource "hcloud_zone_rrset" "wildcard_a" {
  zone = hcloud_zone.ejoneid_dev.name
  name = "*"
  type = "A"
  records = [{ value = hcloud_server.coolify.ipv4_address }]
}

resource "hcloud_zone_rrset" "ns" {
  zone = hcloud_zone.ejoneid_dev.id
  name = "@"
  type = "NS"
  records = [
    { value = "helium.ns.hetzner.de." },
    { value = "hydrogen.ns.hetzner.com." },
    { value = "oxygen.ns.hetzner.com." },
  ]
}
