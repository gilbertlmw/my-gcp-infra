terraform {
  backend "gcs" {
    bucket = "my-gha-infra-state-2025"
    prefix = "dev"
  }
}
