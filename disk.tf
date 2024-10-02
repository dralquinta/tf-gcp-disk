resource "google_compute_disk" "disk" {
  name  = var.disk_name
  size  = var.disk_size_gb
  type  = "pd-standard"
  zone  = var.zone
}

resource "google_compute_attached_disk" "attach_disk" {
  instance = var.instance
  disk     = google_compute_disk.disk.name
  zone     = var.zone
}


