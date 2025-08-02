resource "google_service_account" "gha" {
  account_id   = "gha-deployer"
  display_name = "GitHub Actions SA"
}

