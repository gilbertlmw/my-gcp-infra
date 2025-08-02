variable "project_id" {
  description = "Your GCP project ID"
  type        = string
}

variable "project_number" {
  description = "The numeric ID of the GCP project"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "australia-southeast1"
}

variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
}
