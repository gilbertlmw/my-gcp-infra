# 1. Instantiate Storage Module
module "gcs" {
  source = "../../modules/gcs"

  project_id    = var.project_id
  bucket_name   = "my-gcp-job-data-dev"
  location      = var.region
  force_destroy = true # Dev safeguard setting
}

# 2. Instantiate BigQuery Module
module "bigquery" {
  source = "../../modules/bigquery"

  project_id                 = var.project_id
  dataset_id                 = "my_job_db_dev"
  location                   = var.region
  delete_contents_on_destroy = true # Dev safeguard setting
}

# 3. Instantiate GHA Identity Module
module "gha_identity" {
  source = "../../modules/gha_identity"

  project_id         = var.project_id
  service_account_id = "gha-job-runner-dev"
  github_repo        = var.github_repo

  # Wire outputs from GCS & BigQuery modules
  target_bucket_name = module.gcs.bucket_name
  target_dataset_id  = module.bigquery.dataset_id
}