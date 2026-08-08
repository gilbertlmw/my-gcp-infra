variable "project_id" {
  description = "Dev GCP Project ID"
  type        = string
}

variable "region" {
  description = "Primary GCP Region"
  type        = string
  default     = "australia-southeast1"
}

variable "github_repo" {
  description = "GitHub repository formatted as 'owner/repo'"
  type        = string
  default     = "gilbertlmw/my-gcp-infra"
}