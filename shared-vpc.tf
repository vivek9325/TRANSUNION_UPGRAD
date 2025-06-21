resource "google_compute_vpc_host_project" "host" {

    project = google_project.host-staging.number


}

resource "google_compute_shared_vpc_service_project" "service" {

    host_project = "upgradlabs-1746877450825"
    service_project = "upgradlabs-1746877450825"

    depends_on = [google_compute_shared_vpc_host_project.host]

}

