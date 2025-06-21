resource "google_container_cluster" "gke" {

    name = "gke"
    location = local.region
    project = "upgradlabs-1746877450825"

    networking_mode = "VPC_NATIVE"

    network = google_compute_network.main.self_link
    subnetwork = google_compute_subnetwork.private.self_link

    remove_default_node_pool = true
    initial_node_count = 1


    release_channel {
      channel = "REGULAR"
  
}

ip_allocation_policy {

    cluster_secondary_range_name = "pod-ip-range"
    services_secondary_range_name = "services-ip-range"

}

network_policy{

    provider = "PROVIDER_UNSPECIFIED"
    enabled = true



}
}

resource "google_container_node_pool" "general" {

    name = "general"
    location = local.region
    cluster = google_container_cluster.gke.name
    project = "upgradlabs-1746877450825"
    //node_code = 1

    management {

        auto_repair = true
        auto_upgrade = true

    }

    node_config {

        labels = {

            role = "general"
        }

        machine_type = "e2-medium"


    }


}
