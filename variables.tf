variable "disk_name" {
  description = "Name of the additional disk"
  type        = string
}

variable "disk_size_gb" {
  description = "Size of the additional disk in GB"
  type        = number
  default     = 100
}

variable "zone" {
  description = "The GCP zone for the disk"
  type        = string
}

variable "instance" {
  description = "Self-link of the instance to attach the disk to"
  type        = string
}
