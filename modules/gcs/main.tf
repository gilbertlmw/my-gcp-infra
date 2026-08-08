resource "google_storage_bucket" "bucket" {
  name                     = var.bucket_name
  project                  = var.project_id
  location                 = var.location
  force_destroy            = var.force_destroy
  public_access_prevention = "enforced"

  uniform_bucket_level_access = true
}