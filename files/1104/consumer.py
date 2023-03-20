#!/usr/bin/env python
# coding=utf-8
import pika
credentials = pika.PlainCredentials('admin', '123456')
parameters = pika.ConnectionParameters('192.168.64.17', 5672, '/', credentials)
connection = pika.BlockingConnection(parameters)
#connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()
channel.queue_declare(queue='hello')
def callback(ch, method, properties, body):
   print(" [x] Received %r" % body)
channel.basic_consume(queue='hello', on_message_callback=callback, auto_ack=False)
channel.start_consuming()
