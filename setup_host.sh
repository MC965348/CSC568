#!/bin/bash

apt update
apt install -y nfs-common
mkdir -p /var/nfs/keys

while [ ! -f /var/nfs/keys/id_rsa ]; do
  mount 192.168.1.1:/var/nfs/keys /var/nfs/keys
  sleep 10
done

cp /var/nfs/keys/id_rsa* /users/mikec123/.ssh/
chown mikec123: /users/mikec123/.ssh/id_rsa*
runuser -u mikec123 -- cat /users/mikec123/.ssh/id_rsa.pub >> /users/mikec123/.ssh/authorized_keys
