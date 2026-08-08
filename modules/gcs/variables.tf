variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "bucket_name" {
  description = "Globally unique name for the GCS bucket"
  type        = string
}

variable "location" {
  description = "GCP Region or Multi-region location"
  type        = string
  default     = "australia-southeast1"
}

variable "force_destroy" {
  description = "Whether to allow deletion of non-empty bucket"
  type        = bool
  default     = false
}