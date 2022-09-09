resource "google_compute_network" "default" {
  name = "vuln-network"
}

resource "google_compute_firewall" "default" {
  name    = "vuln-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000", "22"]
  }

  source_tags = ["web"]
}