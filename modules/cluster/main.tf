resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    use_ip_aliases = true
  }
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = var.num_nodes

  node_config {
    machine_type = var.machine_type
    labels       = { namespace = var.node_label }
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  # Optional: Autoscaling
  autoscaling {
    min_node_count = 1
    max_node_count = var.num_nodes * 2
  }
}
