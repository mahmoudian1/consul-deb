#!/bin/bash

rm -rf /var/consul > /dev/null 2>&1
rm -rf /var/log/consul > /dev/null 2>&1
rm -rf /etc/consul.d > /dev/null 2>&1
rm -f /etc/consul.conf > /dev/null 2>&1
rm -f /etc/init/consul.conf > /dev/null 2>&1

userdel -r consul > /dev/null 2>&1
