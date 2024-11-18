resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  # Specify the VPC and Subnet
  network    = "projects/halogen-obelisk-441705-u4/global/networks/rk-vpc"   # Replace 'myvpc' with your VPC name
  subnetwork = "projects/halogen-obelisk-441705-u4/regions/${var.region}/subnetworks/rk-sub" # Replace 'mysubnet' with your Subnet name

  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster_secondary_range  # Replace with the secondary range for Pods
    services_secondary_range_name = var.services_secondary_range # Replace with the secondary range for Services
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
