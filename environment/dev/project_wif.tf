resource "google_service_account_iam_member" "github_actions_wif" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${google_service_account.gha.email}"

  role   = "roles/iam.workloadIdentityUser"
  member = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/github-actions-pool/attribute.repository/gilbertlmw/my-gcp-infra"
}
