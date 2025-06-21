resource "google_compute_network" "main" {

    name = "main"
    project = "upgradlabs-1746877450825"
    auto_create_subnetworks = false
    routing_mode = "REGIONAL"
    mtu = 1500
  
}


resource "google_compute_subnetwork" "private" {

    name = "private"
    project = "upgradlabs-1746877450825"
    ip_cidr_range = "10.5.0.0/20"
    region = local.region
    network = google_compute_network.main.self_link
    private_ip_google_access = true

    dynamic "secondary_ip_range" {

        for_each = local.secondary_ip_range

        content {
          
          range_name = secondary_ip_range.key
          ip_cidr_range = secondary_ip_range.value

        }
      
    }
  
}
