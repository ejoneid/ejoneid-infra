resource "minio_s3_bucket" "ejoneid_print_flow_dev" {
  bucket         = "ejoneid-print-flow-dev"
  acl            = "private"
  object_locking = false
}

resource "minio_s3_bucket_cors" "print_flow_dev" {
  bucket = minio_s3_bucket.ejoneid_print_flow_dev.id

  cors_rule {
    allowed_origins = ["https://print.dev.ejoneid.dev"]
    allowed_methods = ["GET", "PUT", "HEAD"]
    allowed_headers = ["content-type", "x-amz-*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

resource "minio_s3_bucket" "ejoneid_dev_bucket" {
  bucket         = "ejoneid-development"
  acl            = "private"
  object_locking = false
}

resource "minio_s3_bucket_cors" "local-development" {
  bucket = minio_s3_bucket.ejoneid_dev_bucket.id

  cors_rule {
    allowed_origins = ["http://localhost:3000"]
    allowed_methods = ["GET", "PUT", "HEAD"]
    allowed_headers = ["content-type", "x-amz-*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

resource "minio_s3_bucket" "ejoneid_volume_backups" {
  bucket         = "ejoneid-coolify-volumes"
  acl            = "private"
  object_locking = false
}

resource "minio_s3_bucket" "ejoneid_coolify_backups" {
  bucket         = "ejoneid-coolify-backups"
  acl            = "private"
  object_locking = false
}
