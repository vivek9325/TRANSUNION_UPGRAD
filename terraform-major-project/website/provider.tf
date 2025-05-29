provider "google" {
  # Configuration options
  credentials = file(var.gcp_svc_key)
  project = var.gcp_project
  region = var.gcp_region
}
