#INCLUDE "PROTHEUS.CH"
#INCLUDE "APWEBSRV.CH"

/* ===============================================================================
WSDL Location    http://www.termaco.com.br/marservice/server.php?wsdl
Gerado em        08/06/13 14:50:13
Observações      Código-Fonte gerado por ADVPL WSDL Client 1.120703
                 Alterações neste arquivo podem causar funcionamento incorreto
                 e serão perdidas caso o código-fonte seja gerado novamente.
=============================================================================== */

User Function _YKWTJWK ; Return  // "dummy" function - Internal Use 

/* -------------------------------------------------------------------------------
WSDL Service WSserver_marservice
------------------------------------------------------------------------------- */

WSCLIENT WSserver_marservice

	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD RESET
	WSMETHOD CLONE
	WSMETHOD BloqueiaCliente

	WSDATA   _URL                      AS String
	WSDATA   _HEADOUT                  AS Array of String
	WSDATA   _COOKIES                  AS Array of String
	WSDATA   ccnpjCliente              AS string
	WSDATA   cstatusCliente            AS string
	WSDATA   lbErro                    AS boolean
	WSDATA   ccObs                     AS string

ENDWSCLIENT

WSMETHOD NEW WSCLIENT WSserver_marservice
::Init()
If !FindFunction("XMLCHILDEX")
	UserException("O Código-Fonte Client atual requer os executáveis do Protheus Build [7.00.101202A-20110919] ou superior. Atualize o Protheus ou gere o Código-Fonte novamente utilizando o Build atual.")
EndIf
Return Self

WSMETHOD INIT WSCLIENT WSserver_marservice
Return

WSMETHOD RESET WSCLIENT WSserver_marservice
	::ccnpjCliente       := NIL 
	::cstatusCliente     := NIL 
	::lbErro             := NIL 
	::ccObs              := NIL 
	::Init()
Return

WSMETHOD CLONE WSCLIENT WSserver_marservice
Local oClone := WSserver_marservice():New()
	oClone:_URL          := ::_URL 
	oClone:ccnpjCliente  := ::ccnpjCliente
	oClone:cstatusCliente := ::cstatusCliente
	oClone:lbErro        := ::lbErro
	oClone:ccObs         := ::ccObs
Return oClone

// WSDL Method BloqueiaCliente of Service WSserver_marservice

WSMETHOD BloqueiaCliente WSSEND ccnpjCliente,cstatusCliente WSRECEIVE lbErro,ccObs WSCLIENT WSserver_marservice
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<q1:BloqueiaCliente xmlns:q1="urn:server_marservice">'
cSoap += WSSoapValue("cnpjCliente", ::ccnpjCliente, ccnpjCliente , "string", .T. , .T. , 0 , NIL, .F.) 
cSoap += WSSoapValue("statusCliente", ::cstatusCliente, cstatusCliente , "string", .T. , .T. , 0 , NIL, .F.) 
cSoap += "</q1:BloqueiaCliente>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"urn:server_marservice#entrada",; 
	"RPCX","urn:server_marservice",,,; 
	"http://www.termaco.com.br/marservice/server.php?debug=1")

::Init()
::lbErro             :=  WSAdvValue( oXmlRet,"_BERRO","boolean",NIL,NIL,NIL,"L",NIL,NIL) 
::ccObs              :=  WSAdvValue( oXmlRet,"_COBS","string",NIL,NIL,NIL,"S",NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.



