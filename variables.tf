variable "project_id" {}
variable "region" {}
variable "compute_zone" {}

# VPC-related variables
variable "vpc_name" {}
variable "subnet_name" {}
variable "network_range" {}

# Cluster-related variables
variable "cluster_name" {}
variable "num_nodes" {}
variable "machine_type" {}
variable "node_label" {}
variable "max_pods_per_node" {}
