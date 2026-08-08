resource "google_bigquery_dataset" "equity_research" {
  dataset_id                  = "equity_research"
  project                     = project_id
  location                    = "AUSTRALIA-SOUTHEAST1"

  labels = {
    environment = "dev"
  }
}