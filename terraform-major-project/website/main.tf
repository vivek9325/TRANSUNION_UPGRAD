terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.37.0"
    }
  }
}


resource "google_storage_bucket" "website" {

    name = "vk-29-05-2025"
    location = "US"
  
}


resource "google_storage_object_access_control" "public_rule" {

    object = google_storage_bucket_object.static_site_src.name
    bucket = google_storage_bucket.website.name
    role = "READER"
    entity = "allUsers"

  
}

resource "google_storage_bucket_object" "static_site_src" {

    name = "index.html"
    source = "index.html"
    bucket = google_storage_bucket.website.name
  
}
