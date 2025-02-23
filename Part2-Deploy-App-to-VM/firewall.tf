# Allow SSH
resource "google_compute_firewall" "allow_ssh" {
  name = "${local.name}-fwrule-allow-ssh22"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.myvpc.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-tag"]
}

# Allow HTTP Port 80
resource "google_compute_firewall" "allow_http" {
  name = "${local.name}-fwrule-allow-http80"
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.myvpc.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver-tag"]
}

