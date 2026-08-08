output "service_account_email" {
  value       = google_service_account.gha_sa.email
  description = "Service account email for GHA deployment workflows"
}