resource "google_compute_router" "router" {

    name = "router"
    region = local.region
    project ="upgradlabs-1746877450825"
    network = google_compute_network.main.self_link
  
}
