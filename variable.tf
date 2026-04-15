variable "google_creds" {
  description = "GCP Service Account JSON credentials"
  type        = string
  sensitive   = true
}

provider "google" {
    project = var.projectid
    region = "us-central1"
credentials = var.google_creds
}
