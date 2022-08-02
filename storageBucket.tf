resource "google_storage_bucket" "testStorageBucket1" {
  name          = "testStorageBucket1"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = "3"
    }
    action {
      type = "Delete"
    }
  }

  versioning {
    enabled = false
  }
}

resource "google_storage_bucket" "testStorageBucket2" {
  name          = "testStorageBucket2"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = "3"
    }
    action {
      type = "Delete"
    }
  }
  retention_policy {
    retention_period = 7760
  }
  uniform_bucket_level_access = false
}