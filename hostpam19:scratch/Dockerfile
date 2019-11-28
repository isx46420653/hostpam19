# PAM from Scratch # PAM from Scratch
FROM fedora:27
LABEL version="1.0"
LABEL author="Pau Martín"
LABEL subject="Hostpam authentication from scratch"
RUN dnf -y install vim procps passwd nss-pam-ldapd authconfig openldap-clients
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/startup.sh
WORKDIR /opt/docker
CMD /opt/docker/startup.sh
