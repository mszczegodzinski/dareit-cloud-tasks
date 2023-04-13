resource "google_compute_instance" "dareit-vm-ci" {
  name         = "dareit-vm-task-8"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["dareit", "task-8"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        managed_by_terraform = "true"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}

resource "google_storage_bucket" "task-8-new-bucket" {
  name          = "task-8-new-bucket"
  location      = "US"
  storage_class = "STANDARD"
  force_destroy = true
}

resource "google_storage_bucket_object" "cat_pic" {
  name   = "cat.webp"
  bucket = google_storage_bucket.task-8-new-bucket.name
  source = "./webapp/cat.webp"
}


resource "google_storage_bucket_object" "website" {
  name   = "index.html"
  bucket = google_storage_bucket.task-8-new-bucket.name
  content_type = "text/html"
  source = "./webapp/index.html"
}
