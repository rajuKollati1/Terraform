variable "max_pods_per_node" {
  description = "Maximum pods per node"
  type        = number
}

resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  remove_default_node_pool = true
  initial_node_count = 1

  # Other necessary cluster configurations
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = var.num_nodes

  node_config {
    machine_type             = var.machine_type
    labels                   = { namespace = var.node_label }
    oauth_scopes             = ["https://www.googleapis.com/auth/cloud-platform"]

    # Use max_pods_per_node here
    default_max_pods_per_node = var.max_pods_per_node
  }
}

