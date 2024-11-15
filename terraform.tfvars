project_id      = "halogen-obelisk-441705-u4"
region          = "us-central1"
compute_zone    = "us-central1-a"
vpc_name        = "my-vpc"
subnet_name     = "my-subnet"
network_range   = "10.15.0.0/16"
cluster_name    = "my-cluster"
num_nodes       = 2
machine_type    = "e2-medium"
node_label      = "environment=prod"
max_pods_per_node = 80
