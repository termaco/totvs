#Include 'Protheus.ch'
//Autor: Saulo Gomes Martins
//Data : 06/08/2013
//Descrição: PE para integração com Guberman
User Function MA030TOK()
Local oWS
Local lRet	:= .T.
If ALTERA .AND. M->A1_YBLOQ<>SA1->A1_YBLOQ
	oWS	:= YSA1():New()
	If !oWS:BloqueiaCliente(M->A1_CGC,M->A1_YBLOQ)
		Aviso("M030ALT",;
							" Modal:"+If(oWS:lOk1,"Enviado","Problema")+chr(13)+chr(10)+;
							" Retorno:"+oWS:cErro1+chr(13)+chr(10)+;
							chr(13)+chr(10)+;
							" Cargas Rodoviário:"+If(oWS:lOk2,"Enviado","Problema")+chr(13)+chr(10)+;
							" Retorno:"+oWS:cErro2+chr(13)+chr(10)+;
							chr(13)+chr(10)+;
							" Cargas Container:"+If(oWS:lOk3,"Enviado","Problema")+chr(13)+chr(10)+;
							" Retorno:"+oWS:cErro3+chr(13)+chr(10)+;
							"",{"OK"},3)
	EndIf
EndIf
Return lRet