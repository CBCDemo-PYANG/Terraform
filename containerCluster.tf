resource "google_container_cluster" "testContainerCluster" {
  name            = "marcellus-wallace"
  logging_service = "none"
  ip_allocation_policy {
    cluster_secondary_range_name  = "some-name"
    services_secondary_range_name = "some-name"
  }
  node_config {
    workload_metadata_config {
      mode = "MODE_UNSPECIFIED"
    }
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.0.0/16"
      display_name = "display_name"
    }
  }
}