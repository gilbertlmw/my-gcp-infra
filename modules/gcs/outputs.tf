output "bucket_name" {
  value       = google_storage_bucket.bucket.name
  description = "Name of the storage bucket"
}

output "bucket_url" {
  value       = google_storage_bucket.bucket.url
  description = "URL of the storage bucket"
}