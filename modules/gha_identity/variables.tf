variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "service_account_id" {
  description = "ID for the Service Account"
  type        = string
}

variable "github_repo" {
  description = "GitHub Repository formatted as 'owner/repository'"
  type        = string
}

variable "target_bucket_name" {
  description = "GCS bucket name to grant objectAdmin access"
  type        = string
}

variable "target_dataset_id" {
  description = "BigQuery dataset ID to grant dataEditor access"
  type        = string
}