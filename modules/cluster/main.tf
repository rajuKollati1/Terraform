resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = var.num_nodes
  node_config {
    machine_type = var.machine_type
    labels       = { env = var.node_label }
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
  ip_allocation_policy {}
  max_pods_per_node = var.max_pods_per_node
}
