resource "google_storage_bucket" "gcp_bucket" {
  name     = var.bucket_name
  location = var.region
  force_destroy = true

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [location]
  }
}

resource "google_storage_bucket" "gcp_bucket_1" {
  name     = var.bucket_name_1
  location = var.region
  force_destroy = true

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [location]
  }
}
