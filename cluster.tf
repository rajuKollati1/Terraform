resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.compute_zone
  initial_node_count = var.num_nodes
  network            = google_compute_network.vpc_network.id
  subnetwork         = google_compute_subnetwork.subnet.id

  node_config {
    machine_type = var.machine_type
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    labels       = { namespace = var.node_label }
    disk_type    = "pd-standard"
    disk_size_gb = 70
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  ip_allocation_policy {
    use_ip_aliases = true
  }

  enable_autopilot = false

  pod_security_policy_config {
    enabled = false
  }

  max_pods_per_node = var.max_pods_per_node
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
