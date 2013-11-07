#include 'totvs.ch'
#include "topconn.ch"
#include "rwmake.ch"
#INCLUDE "APWEBSRV.CH"
#include "TbiConn.ch"
#include "TbiCode.ch"

WSSERVICE YCLIENTE DESCRIPTION "Consulta informações de cliente"
	WSDATA c_Empresa	AS String
	WSDATA c_Filial		AS String
	WSDATA c_Cnpj		AS String
	WSDATA Retorno		AS YCliente_Retorno
	WSMETHOD ConsultaCliente

ENDWSSERVICE

WSSTRUCT YCliente_Retorno
	WSDATA bErro		AS Boolean
	WSDATA cObs		AS String	OPTIONAL
	WSDATA cRazao		AS String	OPTIONAL
	WSDATA cEnd		AS String	OPTIONAL
	WSDATA cCompl		AS String	OPTIONAL
	WSDATA cEst		AS String	OPTIONAL
	WSDATA cMunic		AS String	OPTIONAL
	WSDATA cBairro		AS String	OPTIONAL
	WSDATA cCep		AS String	OPTIONAL
	WSDATA cDDD		AS String	OPTIONAL
	WSDATA cTel		AS String	OPTIONAL
	WSDATA cInscst		AS String	OPTIONAL
	WSDATA cInscmn		AS String	OPTIONAL
ENDWSSTRUCT

//-----------------------------------------------------------------
WSMETHOD ConsultaCliente WSRECEIVE c_Empresa,c_Filial,c_Cnpj WSSEND Retorno WSSERVICE YCLIENTE
RESET ENVIRONMENT
RpcSetType(3)
RPCSetEnv(::c_Empresa,::c_Filial,"JOB",,'FAT')

::Retorno	:= WsClassNew("YCliente_Retorno")
::Retorno:bErro	:= .F.
::Retorno:cObs	:= ""
DbSelectArea("SA1")
DbSetOrder(3)	//A1_FILIAL+A1_CGC
If !DbSeek(xFilial("SA1")+::c_Cnpj)
	::Retorno:bErro	:= .T.
	::Retorno:cObs	:= "Cliente não encontrado!"
	Return .T.
Else
	::Retorno:cRazao	:= SA1->A1_NOME
	::Retorno:cEnd	:= SA1->A1_END
	::Retorno:cCompl	:= SA1->A1_COMPLEM
	::Retorno:cEst	:= SA1->A1_EST
	::Retorno:cMunic	:= SA1->A1_MUN
	::Retorno:cBairro	:= SA1->A1_BAIRRO
	::Retorno:cCep	:= SA1->A1_CEP
	::Retorno:cDDD	:= SA1->A1_DDD
	::Retorno:cTel	:= SA1->A1_TEL
	::Retorno:cInscst	:= SA1->A1_INSCR
	::Retorno:cInscmn	:= SA1->A1_INSCRM
EndIf
Return .T.