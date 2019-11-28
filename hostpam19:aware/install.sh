#/bin/bash

# Creem els usuaris
useradd -M pau
useradd -M anna
echo "pau" | passwd --stdin pau
echo "anna" | passwd --stdin anna
# Copiem els arxius corresponents
cp /opt/docker/login.defs /etc/login.defs
cp /opt/docker/chfn /etc/pam.d/chfn
# Guardem les configuracions de PAM realitzades
mkdir /opt/docker/python
cp /opt/docker/pam_mates.py /opt/docker/python/.
cp /opt/docker/pam_permit.py /opt/docker/python/.
cp /opt/docker/pam_python.so /usr/lib64/security/.
