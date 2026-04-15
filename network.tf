variable "project-id" {}

variable "google_creds" {
  description = "GCP Service Account JSON credentials"
  type        = string
  sensitive   = true
}

provider "google" {
    project = var.project-id
    region = "us-central1"
credentials = var.google_creds
}

resource "google_compute_network" "vpc" {
  project                 = var.project-id
  name                    = "my-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  project       = var.project-id
  name          = "my-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc.id
}
