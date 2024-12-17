
terraform {
    backend "gcs" { 
      bucket  = "astro-tinacms-test-backend_state"
      prefix  = "prod"
    }
}

provider "google" {
  project = var.gcp_project_id
  region = var.gcp_region
}