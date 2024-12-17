
terraform {
    backend "gcs" { 
      bucket  = "astro-tinacms-test-backend_state"
      prefix  = "prod"
    }
}

provider "google" {
  project = var.project
  region = var.region
}