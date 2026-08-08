resource "google_project_iam_member" "gha_compute_admin" {
  project = var.project_id
  role    = "roles/compute.admin"
  member  = "serviceAccount:${google_service_account.gha.email}"
}

resource "google_project_iam_member" "gha_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.gha.email}"
}

resource "google_project_iam_member" "gha_bigquery_admin" {
  project = var.project_id
  role    = "roles/bigquery.admin"
  member  = "serviceAccount:${google_service_account.gha.email}"
}

resource "google_project_iam_member" "gha_wif_bigquery_admin" {
  project = var.project_id
  role    = "roles/bigquery.admin"
  member  = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/github-actions-pool/attribute.repository/gilbertlmw/my-gcp-infra"
}
