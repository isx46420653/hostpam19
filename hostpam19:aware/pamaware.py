#!/usr/bin/python
# -*- coding: utf-8 -*-

# Programa python que verifica que qui l'executa és un usuari UNIX vàlid

import pam
p=pam.pam()
userName=raw_input("Nom usuari: ")
userPasswd=raw_input("Password: ")
p.authenticate(userName, userPasswd)
print('{} {}'.format(p.code,p.reason))
if p.code == 0:
	print userName + " és un usuari UNIX vàlid"
else:
	print "NO és un usuari UNIX vàlid"

