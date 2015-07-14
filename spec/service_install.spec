#!/bin/bash

useradd -M consul > /dev/null 2>&1
mkdir -p /var/consul > /dev/null 2>&1
chown consul:consul /var/consul/ > /dev/null 2>&1
mkdir -p /var/log/consul > /dev/null 2>&1
chown consul:consul /var/log/consul/ > /dev/null 2>&1
