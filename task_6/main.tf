provider "google" {
  project = "zinc-window-378320"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_storage_bucket" "my_task_6_bucket" {
  name          = "my_task_6_bucket"
  location      = "US"
  force_destroy = true
}

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.my_task_6_bucket.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers"
  ]
}

resource "google_compute_instance" "my-task-6-instance" {
  name         = "my-task-6-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["task-6", "dare-it-task-6"]

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

    access_config {}
  }
}

resource "google_sql_database_instance" "dareit" {
  name             = "dareit"
  database_version = "POSTGRES_14"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"

    database_flags {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }
  }
}

resource "google_sql_user" "postgres_user" {
  name     = "dareit_user"
  password = "your-initial-password"
  instance = google_sql_database_instance.dareit.name
}
