resource "google_compute_network" "myvpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "mysubnet" {
  name          = "subnet-public"
  region        = var.region
  network       = google_compute_network.myvpc.name
  ip_cidr_range = var.subnet_cidr_block
}
