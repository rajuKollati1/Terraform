provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source       = "./modules/vpc"
  vpc_name     = var.vpc_name
  subnet_name  = var.subnet_name
}

module "region" {
  source      = "./modules/region"
  project_id  = var.project_id
  region      = var.region
}

module "cluster" {
  source             = "./modules/cluster"
  cluster_name       = var.cluster_name
  num_nodes          = var.num_nodes
  machine_type       = var.machine_type
  node_label         = var.node_label
  max_pods_per_node  = var.max_pods_per_node
  region             = var.region 
}
