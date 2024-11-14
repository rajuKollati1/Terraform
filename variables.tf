variable "project_id" {}
variable "region" {
  default = "asia-east1"
}
variable "compute_zone" {
  default = "asia-east1-a"
}
variable "vpc_name" {
  default = "my-vpc001"
}
variable "subnet_name" {
  default = "my-vpc001"
}
variable "cluster_name" {
  default = "rk-cluster-01"
}
variable "num_nodes" {
  default = 2
}
variable "machine_type" {
  default = "e2-medium"
}
variable "node_label" {
  default = "namespace=rk-lable-node-01"
}
variable "max_pods_per_node" {
  default = 80
}
