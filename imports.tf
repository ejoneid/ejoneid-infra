import {
  to = minio_s3_bucket.ejoneid_print_flow_dev
  id = "ejoneid-print-flow-dev"
}

import {
  to = minio_s3_bucket.ejoneid_dev_bucket
  id = "ejoneid-development"
}

import {
  to = minio_s3_bucket.ejoneid_coolify_backups
  id = "ejoneid-coolify-backups"
}

import {
  to = minio_s3_bucket.ejoneid_volume_backups
  id = "ejoneid-coolify-volumes"
}

import {
  to = hcloud_zone.ejoneid_dev
  id = var.ejoneid_zone_id
}

import {
  to = hcloud_server.coolify
  id = var.coolify_server_id
}

import {
  to = hcloud_zone_rrset.wildcard_a
  id = "${var.ejoneid_zone_id}/*/A"
}

import {
  to = hcloud_zone_rrset.ns
  id = "${var.ejoneid_zone_id}/@/NS"
}
