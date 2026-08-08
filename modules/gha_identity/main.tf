resource "google_service_account" "gha_sa" {
  account_id   = var.service_account_id
  display_name = "GitHub Actions Service Account (${var.service_account_id})"
  project      = var.project_id
}

resource "google_service_account_iam_member" "workload_identity_user" {
  service_account_id = google_service_account.gha_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/${var.project_id}/locations/global/workloadIdentityPools/github-pool/attribute.repository/${var.github_repo}"
}

resource "google_storage_bucket_iam_member" "bucket_admin" {
  bucket = var.target_bucket_name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.gha_sa.email}"
}

resource "google_bigquery_dataset_iam_member" "dataset_editor" {
  dataset_id = var.target_dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.gha_sa.email}"
}