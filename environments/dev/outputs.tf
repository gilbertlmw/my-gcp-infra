output "dev_gha_service_account" {
  value       = module.gha_identity.service_account_email
  description = "Service account used by GitHub Actions in dev"
}