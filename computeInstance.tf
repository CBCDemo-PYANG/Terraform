resource "google_compute_instance" "testComputeInstance-1" {
  name         = "testComputeInstance-1"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  confidential_instance_config {
    enable_confidential_compute = false
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance" "testComputeInstance-2" {
  name         = "testComputeInstance-2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["block-project-ssh-keys", "false"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

  }

  metadata = {
    block-project-ssh-keys = "false"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["cloud-platform"]
  }
}