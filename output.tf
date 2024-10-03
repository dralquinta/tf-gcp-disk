output "disk_self_link" {
  value = google_compute_disk.disk.self_link
}

output "disk_name" {
  value = google_compute_disk.disk.name
}

# Output the mount command
output "mount_command" {
  value = <<-EOT
    #!/bin/bash
    DISK_NAME="/dev/disk/by-id/google-${google_compute_disk.disk.name}"
    MOUNT_POINT="/mnt/disks/${google_compute_disk.disk.name}"

    # Create the mount point and mount the disk
    sudo mkdir -p ${MOUNT_POINT}
    sudo mount -o discard,defaults ${DISK_NAME} ${MOUNT_POINT}

    # Add the disk to /etc/fstab for auto-mount on reboot
    echo "${DISK_NAME} ${MOUNT_POINT} ext4 discard,defaults 1 1" | sudo tee -a /etc/fstab
  EOT
}