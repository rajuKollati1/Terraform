provider "google" {
  credentials = file(var.credentials_file_path)
  project     = var.project_id
  region      = var.region
  zone        = var.compute_zone
}

# Load variables
variable "credentials_file_path" {}
variable "project_id" {}

module "vpc" {
  source = "./vpc.tf"
}

module "region" {
  source = "./region.tf"
}

module "cluster" {
  source = "./cluster.tf"
}
