resource "google_bigquery_dataset" "equity_research" {
  dataset_id                  = "equity_research"
  project                     = project_id
  location                    = "AUSTRALIA-SOUTHEAST1"

  labels = {
    environment = "dev"
  }
}

resource "google_bigquery_dataset_access" "equity_research_access" {
  dataset_id = google_bigquery_dataset.equity_research.dataset_id
  project    = google_bigquery_dataset.equity_research.project

  role          = "roles/bigquery.dataEditor"
  user_by_email = "gha-deployer@stocks-415200.iam.gserviceaccount.com"
}