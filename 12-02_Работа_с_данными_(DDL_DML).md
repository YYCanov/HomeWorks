# Домашнее задание к занятию 12.2 «Работа с данными (DDL/DML)» `Юрий Чеканов`

Задание можно выполнить как в любом IDE, так и в командной строке.

### Задание 1

1.1. Поднимите чистый инстанс MySQL версии 8.0+. Можно использовать локальный сервер или контейнер Docker.

1.2. Создайте учётную запись sys_temp.

1.3. Выполните запрос на получение списка пользователей в базе данных. (скриншот)

<img src="pics\1202\1202_SELECT_USER.jpg" alt="SELECT_USER" style="zoom:90%;" />

1.4. Дайте все права для пользователя sys_temp.

1.5. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)

<img src="pics\1202\1202_SELECT_ALL.jpg" alt="1202_SELECT_ALL" style="zoom:90%;" />

<img src="pics\1202\1202_SHOW_GRANTS_4_SYS_TEMP.jpg" alt="1202_SHOW_GRANTS_4_SYS_TEMP" style="zoom:90%;" />

1.6. Переподключитесь к базе данных от имени sys_temp.

Для смены типа аутентификации с sha2 используйте запрос:

```
ALTER USER 'sys_test'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

1.6. По ссылке https://downloads.mysql.com/docs/sakila-db.zip скачайте дамп базы данных.

1.7. Восстановите дамп в базу данных.

1.8. При работе в IDE сформируйте ER-диаграмму получившейся базы данных. При работе в командной строке используйте команду для получения всех таблиц базы данных. (скриншот)

<img src="pics\1202\ERD.png" alt="ERD" style="zoom:50%;" />

*Результатом работы должны быть скриншоты обозначенных заданий, а также простыня со всеми запросами.*

[Простыня с запросами](files\1202\query_list.txt) 

### Задание 2

Составьте таблицу, используя любой текстовый редактор или Excel, в которой должно быть два столбца: в первом должны быть названия таблиц восстановленной базы, во втором названия первичных ключей этих таблиц. Пример: (скриншот/текст)

```
Название таблицы | Название первичного ключа
customer         | customer_id
```

| Table  Name   | Id Name      |
| ------------- | ------------ |
| _language     | language_id  |
| actor         | actor_id     |
| address       | address_id   |
| category      | category_id  |
| city          | city_id      |
| country       | country_id   |
| customer      | customer_id  |
| film          | film_id      |
| film_actor    | actor_id     |
| film_category | film_id      |
| film_text     | film_id      |
| inventory     | inventory_id |
| payment       | payment_id   |
| rental        | rental_id    |
| staff         | staff_id     |
| store         | store_id     |

### Задание 3*

3.1. Уберите у пользователя sys_temp права на внесение, изменение и удаление данных из базы sakila.

mysql> REVOKE ALL PRIVILEGES ON *.* FROM 'sys_temp'@'%';
Query OK, 0 rows affected (0.01 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT ALL PRIVILEGES ON mysql.* TO 'sys_temp'@'%';
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT ALL PRIVILEGES ON sys.* TO 'sys_temp'@'%';
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT SELECT ON sakila.* TO 'sys_temp'@'%';
Query OK, 0 rows affected (0.02 sec)

3.2. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)

mysql> SHOW GRANTS FOR 'sys_temp'@'%';  

```
+-----------------------------------------------------+  
| Grants for sys_temp@%                               |  
+-----------------------------------------------------+
| GRANT USAGE ON *.* TO `sys_temp`@`%`                |  
| GRANT ALL PRIVILEGES ON `mysql`.* TO `sys_temp`@`%` |  
| GRANT SELECT ON `sakila`.* TO `sys_temp`@`%`        |  
| GRANT ALL PRIVILEGES ON `sys`.* TO `sys_temp`@`%`   |  
+-----------------------------------------------------+      
```

*Результатом работы должны быть скриншоты обозначенных заданий, а также простыня со всеми запросами.*

[Простыня с запросами](files\1202\query_list.txt) 



