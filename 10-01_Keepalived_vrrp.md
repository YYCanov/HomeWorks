# Домашнее задание к занятию "10.1. Keepalived/vrrp" - `Юрий Чеканов`

---

### Задание 1. 

Требуется развернуть топологию из лекции и выполнить установку и настройку сервиса Keepalived. 

*Пришлите  конфигурацию сервисов для каждой ноды.   
 Скриншот вывода команды  ip address.*

---

<ins>*instance 1:*<ins>

```ini
vrrp_instance failover_test {
state MASTER
interface enp0s8
virtual_router_id 10
priority 255
advert_int 4
authentication {
auth_type AH
auth_pass 1111
}
unicast_src_ip 192.168.0.1
unicast_peer {
192.168.0.2
}
virtual_ipaddress {
192.168.0.50 dev enp0s8 label enp0s8:vip
}
}
```
<img src = "pics/1001/instance1_status.png" width = 100%>
<img src = "pics/1001/instance1_ip_a.png" width = 100%>


<ins>*instance 2:*<ins>

```ini
vrrp_instance failover_test {
state BACKUP
interface enp0s8
virtual_router_id 10
priority 110
advert_int 4
authentication {
auth_type AH
auth_pass 1111
}
unicast_src_ip 192.168.0.2
unicast_peer {
192.168.0.1
}
virtual_ipaddress {
192.168.0.50 dev enp0s8 label enp0s8:vip
}
}
```
<img src = "pics/1001/instance2_status.png" width = 100%>
<img src = "pics/1001/instance2_ip_a.png" width = 100%>

---
 
### Задание 2*.

Проведите тестирование работы ноды, когда один из интерфейсов выключен. Для этого:
- добавьте еще одну виртуальную машину и включите ее в сеть;
- на машине установите wireshark и запустите процесс прослеживания интерфейса;
- запустите процесс ping на виртуальный хост;
- выключите интерфейс на одной ноде (мастер), остановите wireshark;
- найдите пакеты ICMP, в которых будет отображён процесс изменения MAC адреса одной ноды на другой. 

 *Пришлите скриншот до и после выключения интерфейса из Wireshark.*
 
---

<img src = "pics/1001/wireshark1.png" width = 100%> 
<img src = "pics/1001/wireshark2.png" width = 100%> 

<ins>*C arping наглядно видно также:*<ins>
<img src = "pics/1001/arping.png" width = 100%> 