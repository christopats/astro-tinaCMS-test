resource "google_storage_bucket" "raw" {
  project = var.gcp_project_id
  name = "${var.gcp_data-project}-raw"
  force_destroy = false
  uniform_bucket_level_access = true
  location = var.gcp_region
  labels = local.labels
}