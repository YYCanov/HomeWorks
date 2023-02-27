terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
}

resource "yandex_compute_instance" "node" {
  count       = var.cluster_size
  name        = "yc-auto-instance-${count.index}"
  hostname    = "yc-auto-instance-${count.index}"
  description = "yc-auto-instance-${count.index} of my cluster"
  zone        = element(var.zones, count.index)
  platform_id = var.instance_platform

  resources {
    core_fraction = 20 # No need 100% vCPU performance for test
    cores  = var.instance_cores
    memory = var.instance_memory
  }

# Preemptible VM for test
  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      type     = "network-hdd"
      size     = "5"
    }
  }

  network_interface {
    subnet_id = element(local.subnet_ids, count.index)
    nat       = true
  }

  metadata = {
    ssh-keys = "debian:${file(var.public_key_path)}"
    user-data = file("metadata.yaml")
  }

  labels = {
    node_id = count.index
  }
}

locals {
  external_ips = [yandex_compute_instance.node.*.network_interface.0.nat_ip_address]
  hostnames    = [yandex_compute_instance.node.*.network_interface.0.ip_address]
  hostnames_ips = [yandex_compute_instance.node.*.hostname, yandex_compute_instance.node.*.network_interface.0.nat_ip_address]
}

output "lb_External_IPs" {
#  value = [for s in local.hostnames_ips : "${s}"]
value = yandex_lb_network_load_balancer.foo.listener.*.external_address_spec
}