
resource "google_compute_instance" "ubumtuserver-1" {
  boot_disk {
    auto_delete = true
    device_name = "ubuntu2204"

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230919"
      size  = 32
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = true
  deletion_protection = false
  enable_display      = true

  labels = {
    goog-ec-src           = "vm_add-tf"
    goog-ops-agent-policy = "v2-x86-template-1-1-0"
  }

  machine_type = "n2-standard-8"

  metadata = {
    enable-osconfig = "TRUE"
    ssh-keys        = 
  }

  name = "ubumtuserver-1"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/collabothon23fra-1297/regions/us-central1/subnetworks/axionet"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "306705205881-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["http-server", "https-server", "my-vms"]
  zone = "us-central1-a"
}
