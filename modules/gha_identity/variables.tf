variable "project_id" {
  description = "The GCP Project ID"
  type        = string
}

variable "project_number" {
  description = "The GCP Project Number"
  type        = string
}

variable "gha_service_account_id" {
  description = "The ID for the deployment Service Account"
  type        = string
  default     = "gha-deployer"
}

variable "github_repo" {
  description = "GitHub repository in org/repo format"
  type        = string
}

variable "workload_identity_pool_id" {
  description = "Workload Identity Pool ID"
  type        = string
}

variable "target_bucket_names" {
  description = "List of GCS bucket names to grant storage object access"
  type        = list(string)
}

variable "target_dataset_ids" {
  description = "List of BigQuery dataset IDs to grant data editor permissions"
  type        = list(string)
}