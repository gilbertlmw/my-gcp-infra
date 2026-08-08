variable "project_id" {
  type = string
}

variable "project_number" {
  type = string
}

variable "service_account_id" {
  type = string
}

variable "github_repo" {
  type = string
  description = "Format: owner/repo"
}

variable "workload_identity_pool_id" {
  type = string
  description = "Existing WIF pool ID (not created by Terraform)"
}

variable "target_bucket_name" {
  type = string
}

variable "target_dataset_id" {
  type = string
}
