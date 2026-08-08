# 1. Deployment Service Account
resource "google_service_account" "gha_sa" {
  account_id   = var.gha_service_account_id
  display_name = "GitHub Actions Service Account"
  project      = var.project_id
}

# 2. Workload Identity User Binding
resource "google_service_account_iam_member" "workload_identity_user" {
  service_account_id = google_service_account.gha_sa.name
  role               = "roles/iam.workloadIdentityUser"

  member = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/${var.workload_identity_pool_id}/attribute.repository/${var.github_repo}"
}

# 3. Restricted BigQuery Access (Dataset-level across multiple datasets)
resource "google_bigquery_dataset_iam_member" "dataset_editor" {
  for_each = toset(var.target_dataset_ids)

  dataset_id = each.value
  project    = var.project_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.gha_sa.email}"
}

# 4. Restricted Storage Access (Bucket-level only across specified buckets)
resource "google_storage_bucket_iam_member" "bucket_admin" {
  for_each = toset(var.target_bucket_names)

  bucket = each.value
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.gha_sa.email}"
}

# 5. Restricted Storage Access (it is for the state file)
resource "google_storage_bucket_iam_member" "state_bucket_admin" {
  bucket = var.tf_state_bucket_name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.gha_sa.email}"
}