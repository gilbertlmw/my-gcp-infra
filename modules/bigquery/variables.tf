variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "dataset_id" {
  description = "Unique ID for the BigQuery dataset"
  type        = string
}

variable "location" {
  description = "BigQuery dataset region"
  type        = string
  default     = "australia-southeast1"
}

variable "delete_contents_on_destroy" {
  description = "Delete all tables when destroying dataset"
  type        = bool
  default     = false
}