# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "hot" {
  name       = "hot"
  cluster    = data.terraform_remote_state.k8s.outputs.gke_cluster_id
  version    = var.gke_version
 
  initial_node_count = var.hot_initial_node_count_per_zone
  
  autoscaling {
    min_node_count = var.hot_instance_count_per_zone
    max_node_count = var.hot_max_instance_count_per_zone
  }
 

  upgrade_settings {
    max_surge = var.hot_surge_count
  }


  node_config {
    preemptible  = false
    machine_type = var.hot_instance_type
    image_type   = var.gke_image_type
    disk_size_gb = var.hot_volume
    disk_type    = var.hot_volume_type
   
    labels = var.hot_instance_k8s_label 

    service_account = data.terraform_remote_state.k8s.outputs.gcp_service_account_email
    oauth_scopes = var.gke_oauth_scopes
  }
}