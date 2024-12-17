data "google_storage_project_service_account" "gcs_account" {

}

resource "google_kms_key_ring" "keyring" {
  location = var.gcp_region
  name     = var.gcp_project_id

  depends_on = [
    google_project_service.terraform
  ]
}

resource "google_kms_crypto_key" "backend_state" {
  key_ring = google_kms_key_ring.keyring.id
  name     = "backend_state"

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key_iam_binding" "backend_state" {
  crypto_key_id = google_kms_crypto_key.backend_state.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = ["serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"]
}
