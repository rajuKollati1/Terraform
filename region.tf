provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.compute_zone
}

variable "project_id" {}
variable "region" {
  default = "asia-east1"
}
variable "compute_zone" {
  default = "asia-east1-a"
}
