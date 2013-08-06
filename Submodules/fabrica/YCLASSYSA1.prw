#include 'totvs.ch'
//Autor: Saulo Gomes Martins
//Data : 22/06/2013
//Descrição: Classe para integração com Cargas Rodoviário,Cargas Container,Modal
CLASS YSA1
	DATA oWS1
	DATA lOk1
	DATA cErro1
	DATA oWS2
	DATA lOk2
	DATA cErro2
	DATA oWS3
	DATA lOk3
	DATA cErro3
	METHOD New() CONSTRUCTOR
	METHOD BloqueiaCliente()

ENDCLASS

//-----------------------------------------------------------------
METHOD New() CLASS YSA1
::cErro1	:= ""
::cErro2	:= ""
::cErro3	:= ""
::lOk1		:= .T.
::lOk2		:= .T.
::lOk3		:= .T.
Return Self

//-----------------------------------------------------------------
METHOD BloqueiaCliente(cCnpj,cStatus) CLASS YSA1
Local lRet	:= .T.
::cErro1	:= "Ok!"
::cErro2	:= "Ok!"
::cErro3	:= "Ok!"
::lOk1		:= .T.
::lOk2		:= .T.
::lOk3		:= .T.
//WSDLDBGLEVEL(2)
//Instacia os WebServices
::oWS1	:= WSserver_modallservice():New()
::oWS2	:= WSserver_rodservice():New()
::oWS3	:= WSserver_marservice():New()

//WebService Cargas Rodoviário
::oWS1:ccnpjCliente		:= cCnpj
::oWS1:cstatusCliente	:= cStatus
::oWS2:ccnpjCliente		:= cCnpj
::oWS2:cstatusCliente	:= cStatus
::oWS3:ccnpjCliente		:= cCnpj
::oWS3:cstatusCliente	:= cStatus
If !::oWS1:BloqueiaCliente()
	::cErro1	:= GETWSCERROR(3)
	::lOk1		:= .F.
	lRet		:= .F.
ElseIf ::oWS1:lbErro
	::cErro1	:= ::oWS1:ccObs
	lRet		:= .F.
EndIf

//WebService Cargas Container
If !::oWS2:BloqueiaCliente()
	::cErro2	:= GETWSCERROR(3)
	::lOk2		:= .F.
	lRet		:= .F.
ElseIf ::oWS2:lbErro
	::cErro2	:= ::oWS2:ccObs
	lRet		:= .F.
EndIf

//WebService Modal
If !::oWS3:BloqueiaCliente()
	::cErro3	:= GETWSCERROR(3)
	::lOk3		:= .F.
	lRet		:= .F.
ElseIf ::oWS3:lbErro
	::cErro3	:= ::oWS3:ccObs
	lRet		:= .F.
EndIf

Return lRet