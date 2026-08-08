# 1. Instantiate Storage Module
module "my-gcp-job-data-dev" {
  source = "../../modules/gcs"

  project_id    = var.project_id
  bucket_name   = "my-gcp-job-data-dev"
  location      = var.region
  force_destroy = true # Dev safeguard setting
}

module "my-gcp-job-data-dev-1" {
  source = "../../modules/gcs"

  project_id    = var.project_id
  bucket_name   = "my-gcp-job-data-dev-1"
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

  project_id               = var.project_id
  project_number           = var.project_number
  service_account_id       = "gha-deployer"
  github_repo              = "gilbertlmw/my-gcp-infra"
  workload_identity_pool_id = "github-actions-pool"

  target_bucket_name = "my-tf-state-bucket"
  target_dataset_id  = "equity_research"
}
