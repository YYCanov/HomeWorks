variable "public_key_path" {
  description = "Path to public key file"
  default = 
}

variable "token" {
  description = "Yandex Cloud security OAuth token"
  default = 
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID where resources will be created"
  default = 
}

variable "cloud_id" {
  description = "Yandex Cloud ID where resources will be created"
  default = 
}

variable "zone" {
  description = "Yandex Cloud default Zone for provisoned resources"
  default     = "ru-central1-a"
}

variable "zones" {
  description = "Yandex Cloud default Zone for provisoned resources"
  default     = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
}

variable "yc_image_family" {
  description = "family"
  default     = "debian-11"
}

# example specific
variable "image_id" {
  default = "fd8a67rb91j689dqp60h" # it's debian-11
}

variable "cluster_size" {
  default = 6
}

variable "instance_cores" {
  description = "Cores per one instance"
  default     = "2"
}

variable "instance_memory" {
  description = "Memory in GB per one instance"
  default     = "1"
}

variable "instance_platform" {
  description = "ID of the hardware platform of the VM"
  default     = "standard-v3"
}