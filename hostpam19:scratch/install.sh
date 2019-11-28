#/bin/bash

# Creem uns usuaris de pràctica.

useradd -M local1
useradd -M local2
useradd -M local3
echo "local1" | passwd --stdin local1
echo "local2" | passwd --stdin local2
echo "local3" | passwd --stdin local3
cp /opt/docker/nscd.conf /etc/nscd.conf
cp /opt/docker/nslcd.conf /etc/nslcd.conf
cp /opt/docker/nsswitch.conf /etc/nsswitch.conf
# Permetem la autenticació amb ldap
bash /opt/docker/auth.sh
