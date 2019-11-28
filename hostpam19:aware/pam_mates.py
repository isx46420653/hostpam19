#!/usr/bin/python
# -*- coding: utf-8 -*-

# Mòdul PAM que realitza una operació matemàtica que cal realitzar 
# correctament per a l'autenticació

def pam_sm_authenticate(pamh,flags,argv):
	print "Quant fan 5*3?"
	resposta=raw_input()
	if int(resposta) == 15:
		return pamh.PAM_SUCCESS
	else:
		return pamh.PAM_AUTHTOK_ERR
		
def pam_sm_setcred (pamh, flags, argv):
	return pamh.PAM_SUCCESS

def pam_sm_acct_mgmt (pamh, flags, argv):
	return pamh.PAM_SUCCESS

def pam_sm_open_session (pamh, flags, argv):
	return pamh.PAM_SUCCESS

def pam_sm_close_session (pamh, flags, argv):
	return pamh.PAM_SUCCESS

def pam_sm_chauthtok (pamh, flags, argv):
	return pamh.PAM_SUCCESS
