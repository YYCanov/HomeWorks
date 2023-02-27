resource "yandex_lb_target_group" "my-target-group" {
  name      = "my-target-group"

  dynamic "target" {
    for_each= "${toset(local.inst_list)}"
    content {  
      subnet_id = element(local.subnet_ids, target.value)
      address   = element(local.internal_ips, target.value)
    }
  }
}

resource "yandex_lb_network_load_balancer" "foo" {
  name = "lb-is-mine"
  listener {
    name = "ls-my"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = "${yandex_lb_target_group.my-target-group.id}"
    healthcheck {
      name = "helthch-my"
        http_options {
          port = 80
          path = "/"
        }
    }
  }
}