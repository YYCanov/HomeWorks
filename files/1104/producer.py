#!/usr/bin/env python
# coding=utf-8
import pika
credentials = pika.PlainCredentials('admin', '123456')
parameters = pika.ConnectionParameters('192.168.64.16', 5672, '/', credentials)
connection = pika.BlockingConnection(parameters)
#connection = pika.BlockingConnection(pika.ConnectionParameters('127.0.0.1'))
channel = connection.channel()
channel.queue_declare(queue='hello')
channel.basic_publish(exchange='', routing_key='hello', body='Hello Netology!')
connection.close()
