#!/bin/bash

authconfig --enableshadow --enablelocauthorize \
--enableldap \
--enableldapauth \
--enablemkhomedir \
--ldapserver='ldapserver' \
--ldapbase='dc=edt,dc=org' \
--updateall
