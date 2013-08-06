#INCLUDE "PROTHEUS.CH"
#INCLUDE "APWEBSRV.CH"

/* ===============================================================================
WSDL Location    http://www.termaco.com.br/rodservice/server.php?wsdl
Gerado em        08/06/13 14:50:55
Observações      Código-Fonte gerado por ADVPL WSDL Client 1.120703
                 Alterações neste arquivo podem causar funcionamento incorreto
                 e serão perdidas caso o código-fonte seja gerado novamente.
=============================================================================== */

User Function _LPVUSAO ; Return  // "dummy" function - Internal Use 

/* -------------------------------------------------------------------------------
WSDL Service WSserver_rodservice
------------------------------------------------------------------------------- */

WSCLIENT WSserver_rodservice

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

WSMETHOD NEW WSCLIENT WSserver_rodservice
::Init()
If !FindFunction("XMLCHILDEX")
	UserException("O Código-Fonte Client atual requer os executáveis do Protheus Build [7.00.101202A-20110919] ou superior. Atualize o Protheus ou gere o Código-Fonte novamente utilizando o Build atual.")
EndIf
Return Self

WSMETHOD INIT WSCLIENT WSserver_rodservice
Return

WSMETHOD RESET WSCLIENT WSserver_rodservice
	::ccnpjCliente       := NIL 
	::cstatusCliente     := NIL 
	::lbErro             := NIL 
	::ccObs              := NIL 
	::Init()
Return

WSMETHOD CLONE WSCLIENT WSserver_rodservice
Local oClone := WSserver_rodservice():New()
	oClone:_URL          := ::_URL 
	oClone:ccnpjCliente  := ::ccnpjCliente
	oClone:cstatusCliente := ::cstatusCliente
	oClone:lbErro        := ::lbErro
	oClone:ccObs         := ::ccObs
Return oClone

// WSDL Method BloqueiaCliente of Service WSserver_rodservice

WSMETHOD BloqueiaCliente WSSEND ccnpjCliente,cstatusCliente WSRECEIVE lbErro,ccObs WSCLIENT WSserver_rodservice
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<q1:BloqueiaCliente xmlns:q1="urn:server_rodservice">'
cSoap += WSSoapValue("cnpjCliente", ::ccnpjCliente, ccnpjCliente , "string", .T. , .T. , 0 , NIL, .F.) 
cSoap += WSSoapValue("statusCliente", ::cstatusCliente, cstatusCliente , "string", .T. , .T. , 0 , NIL, .F.) 
cSoap += "</q1:BloqueiaCliente>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"urn:server_rodservice#entrada",; 
	"RPCX","urn:server_rodservice",,,; 
	"http://www.termaco.com.br/rodservice/server.php?debug=1")

::Init()
::lbErro             :=  WSAdvValue( oXmlRet,"_BERRO","boolean",NIL,NIL,NIL,"L",NIL,NIL) 
::ccObs              :=  WSAdvValue( oXmlRet,"_COBS","string",NIL,NIL,NIL,"S",NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.



