output "disk_self_link" {
  value = google_compute_disk.disk.self_link
}

output "disk_name" {
  value = google_compute_disk.disk.name
}

# Output the mount command
# Output the disk mount logic
output "disk_mount_command" {
  value = <<EOT
sudo mkfs.ext4 -F /dev/disk/by-id/google-${google_compute_disk.disk.name} && \
sudo mkdir -p /mnt/disks/${google_compute_disk.disk.name} && \
sudo mount -o discard,defaults /dev/disk/by-id/google-${google_compute_disk.disk.name} /mnt/disks/${google_compute_disk.disk.name} && \
echo '/dev/disk/by-id/google-${google_compute_disk.disk.name} /mnt/disks/${google_compute_disk.disk.name} ext4 discard,defaults 1 1' | sudo tee -a /etc/fstab
EOT
}