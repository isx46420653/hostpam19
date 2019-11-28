#/bin/bash

# Executem les configuracions que volem.
bash /opt/docker/install.sh
/sbin/nscd
# Procès per a que no acabi el PID 1 i s'apagui el contenidor
/sbin/nslcd -d
