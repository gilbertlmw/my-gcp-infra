# 1. Create the Workload Identity Pool
resource "google_iam_workload_identity_pool" "github_pool" {
  workload_identity_pool_id = "github-pool"
  display_name              = "GitHub Actions Pool"
  description               = "Workload Identity Pool for GitHub Actions workflows"
  project                   = var.project_id
}

# 2. Create the Workload Identity Provider
resource "google_iam_workload_identity_pool_provider" "github_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-provider"
  display_name                       = "GitHub Provider"
  project                            = var.project_id

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

# 3. Create the Service Account
resource "google_service_account" "gha_sa" {
  account_id   = var.service_account_id
  display_name = "GitHub Actions Service Account (${var.service_account_id})"
  project      = var.project_id
}

# 4. Bind the Service Account to the Workload Identity Pool
resource "google_service_account_iam_member" "workload_identity_user" {
  service_account_id = google_service_account.gha_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/${var.project_id}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.github_pool.workload_identity_pool_id}/attribute.repository/${var.github_repo}"
}

# 5. Grant Resource IAM Permissions
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