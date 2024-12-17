resource "google_storage_bucket" "backend_state" {
  location      = var.gcp_region
  name          = "${var.gcp_project_id}-backend_state"
  force_destroy = false
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  encryption {
    default_kms_key_name = google_kms_crypto_key.backend_state.id
  }

  lifecycle {
    prevent_destroy = true
  }

  uniform_bucket_level_access = true
  public_access_prevention    = "inherited"

  depends_on = [
    google_project_service.terraform,
    google_kms_crypto_key_iam_binding.backend_state
  ]
}

