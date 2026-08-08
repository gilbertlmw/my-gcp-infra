# 1a. Raw Data Bucket
module "gcs_raw" {
  source = "../../modules/gcs"

  project_id    = var.project_id
  bucket_name   = "my-gcp-job-data-dev"
  location      = var.region
  force_destroy = true
}

# 1b. Processed Data Bucket
module "gcs_secondary" {
  source = "../../modules/gcs"

  project_id    = var.project_id
  bucket_name   = "my-gcp-job-data-processed-dev"
  location      = var.region
  force_destroy = true
}

# Preserve state if gcs was renamed to gcs_raw
moved {
  from = module.gcs
  to   = module.gcs_raw
}

# 2. BigQuery Dataset
module "bigquery" {
  source = "../../modules/bigquery"

  project_id                 = var.project_id
  dataset_id                 = "my_job_db_dev"
  location                   = var.region
  delete_contents_on_destroy = true
}

# 3. GHA Identity Module with Restricted IAM
module "gha_identity" {
  source = "../../modules/gha_identity"

  project_id                = var.project_id
  project_number            = var.project_number
  gha_service_account_id    = "gha-deployer"
  github_repo               = "gilbertlmw/my-gcp-infra"
  workload_identity_pool_id = "github-actions-pool"

  target_bucket_names = [
    module.gcs_raw.bucket_name,
    module.gcs_secondary.bucket_name
  ]

  target_dataset_ids = [
    module.bigquery.dataset_id
  ]
}