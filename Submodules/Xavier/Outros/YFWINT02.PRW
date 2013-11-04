#INCLUDE "APWEBSRV.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"
#INCLUDE 'TOTVS.CH'


/*
Autor.....: Rafael Xavier - TOTVS
Data......: 24/07/13
Descrição.: WebService Modal
*/

WSSERVICE WSMODAL DESCRIPTION "WebService para integração com o modal. Recebimento de OS´s."

	WSDATA cEmp            AS String
	WSDATA cFil			AS String
	WSDATA cNumOS   		AS String
	WSDATA cDtFechamento	AS String
	WSDATA cCnpjCliente  AS String
	WSDATA cVencimento1	AS String
	WSDATA nParcela1		AS Float
	WSDATA cVencimento2	AS String OPTIONAL
	WSDATA nParcela2		AS Float OPTIONAL
	WSDATA cVencimento3	AS String OPTIONAL
	WSDATA nParcela3		AS Float OPTIONAL
	WSDATA cVencimento4	AS String OPTIONAL
	WSDATA nParcela4		AS Float OPTIONAL
	WSDATA cProduto		AS String
	WSDATA cDetalhes		AS String
	WSDATA nQuant			AS Float
	WSDATA nValor			AS Float
	WSDATA nDesc			AS Float OPTIONAL
	WSDATA cAcao		    AS String
	
	WSDATA Retorno		   AS _RETMODAL

	WSMETHOD RECEBEPEDIDO
	
ENDWSSERVICE


WSSTRUCT _RETMODAL

	WSDATA bERRO	    AS Boolean
	WSDATA cObs    	AS String

ENDWSSTRUCT


WSMETHOD RECEBEPEDIDO WSRECEIVE cEmp,cFil,cNumOS,cDtFechamento,cCnpjCliente,cVencimento1,nParcela1,cVencimento2,nParcela2,;
                                    cVencimento3,nParcela3,cVencimento4,nParcela4,cProduto,cDetalhes,nQuant,nValor,nDesc,cAcao;
                                    WSSEND Retorno WSSERVICE WSMODAL

	
	Local lRetorno	:= .T.
	Local aCabec := {}
	Local aItens := {}
	Local nOpc	   := IIF (::cAcao=="I",3,5)
	Local cDoc := GetSxeNum("SC5","C5_NUM")
	Private lMsHelpAuto		:= .T.
	Private lMsErroAuto		:= .F.
	PRIVATE lAutoErrNoFile   := .T.
	PRIVATE cErroLog:= ""
	::Retorno := WsClassNew("_RETMODAL")
	
	//falta fazer prepare enviroment
	RESET ENVIRONMENT
	IF !RPCSetEnv(cEmp,cFil,,,"FAT","",{})
		
		::Retorno:bERRO:=.T.
		::Retorno:cObs:="Problemas na abertura de empresa/Filial. Favor informar a TI da empresa."
		
		RETURN .T.
	ENDIF
	
	//falta implementar a Exclusão. A busca será pelo numero da OS?
	IF nOpc == 5
		cQuery 	:= "SELECT C5_NUM, C6_QTDLIB FROM "+RETSQLNAME("SC5")+" SC5,"+RETSQLNAME("SC6")+" SC6 "
		cQuery 	+= "WHERE C5_YNUMOS='"+::cNumOS+"' AND C5_YORIGEM='M' AND C6_FILIAL=C5_FILIAL AND C6_NUM=C5_NUM AND C5_FILIAL='"+::cFil+"' AND SC5.D_E_L_E_T_=' ' AND SC6.D_E_L_E_T_=' ' "
		
		
		TcQuery cQuery New Alias T02
		IF T02->(EOF())
		
			::Retorno:bERRO:=.T.
			::Retorno:cObs:="OS não encontrada! Verifique: "+::cNumOS
			T02->(dbclosearea())
			RETURN .T.
		ENDIF
		cDoc:=T02->C5_NUM
		//caso não consiga alterar manda e-mail para um grupo de pessoas
		If T02->C6_QTDLIB>0
			cEmail:=getmvpar("MV_YMAIMOD")
			::Retorno:bERRO:=.T.
			::Retorno:cObs:="OS não poderá ser excluida pois já foi liberada para Faturamento! Verifique: "+::cNumOS
			EnviaMail(cEmail,"","Tentativa de Exclusão de OS Modal - OS Num:"+::cNumOS,"Atenção:A OS do Modal está tentando ser excluida!","")
			T02->(dbclosearea())
			RETURN .T.
		
		ENDIF
		T02->(dbclosearea())	
	endif	
	DBSELECTAREA("SA1")
	DBSETORDER(3)
	IF !DBSEEK(XFILIAL("SA1")+::cCnpjCliente)
	
		::Retorno:bERRO:=.T.
		::Retorno:cObs:="CNPJ não encontrado na base de cliente: "+::cCnpjCliente
		
		RETURN .T.
	ENDIF
	
	cQuery 	:= "SELECT B1_COD,B1_TS FROM "+RETSQLNAME("SB1")+" SB1 "
	cQuery 	+= "WHERE B1_FILIAL='"+xFilial("SB1")+"' AND B1_YCODINT='"+::cProduto+"' AND SB1.D_E_L_E_T_=' ' AND B1_YTPCOD='M' "
	
	TcQuery cQuery New Alias T01
	IF T01->(EOF())
	
		::Retorno:bERRO:=.T.
		::Retorno:cObs:="Produto não encontrado no cadastro: "+::cProduto
		T01->(dbclosearea())
		RETURN .T.
	ENDIF
	
	
	aadd(aCabec,{"C5_NUM",cDoc,Nil})
	aadd(aCabec,{"C5_TIPO","N",Nil})
	aadd(aCabec,{"C5_CLIENTE",SA1->A1_COD,Nil})
	aadd(aCabec,{"C5_LOJACLI",SA1->A1_LOJA,Nil})
	aadd(aCabec,{"C5_CLIENT",SA1->A1_COD,Nil})
	aadd(aCabec,{"C5_LOJAENT",SA1->A1_LOJA,Nil})
	aadd(aCabec,{"C5_CONDPAG","001",Nil})
	aadd(aCabec,{"C5_PARC1",::nParcela1,Nil})
	aadd(aCabec,{"C5_DATA1",stod(::cVencimento1),Nil})
	aadd(aCabec,{"C5_PARC2",::nParcela2,Nil})
	aadd(aCabec,{"C5_DATA2",stod(::cVencimento2),Nil})
	aadd(aCabec,{"C5_PARC3",::nParcela3,Nil})
	aadd(aCabec,{"C5_DATA3",stod(::cVencimento3),Nil})
	aadd(aCabec,{"C5_PARC4",::nParcela4,Nil})
	aadd(aCabec,{"C5_DATA4",stod(::cVencimento4),Nil})
	aadd(aCabec,{"C5_MENNOTA",::cDetalhes,Nil})
	aadd(aCabec,{"C5_YNUMOS",::cNumOS,Nil})//Campo Customizado
	aadd(aCabec,{"C5_YORIGEM","M",Nil})//Campo Customizado
	aadd(aCabec,{"C5_YDTOS",stod(::cDtFechamento),Nil})//Campo Customizado
	
	
					
	aLinha := {}		
	aadd(aLinha,{"LINPOS","C6_ITEM",StrZero(1,2)})
	aadd(aLinha,{"AUTDELETA","N",Nil})
	aadd(aLinha,{"C6_PRODUTO",SB1->B1_COD,Nil})
	aadd(aLinha,{"C6_QTDVEN",::nQuant,Nil})
	aadd(aLinha,{"C6_PRCVEN",::nValor,Nil})
//	aadd(aLinha,{"C6_VALOR",(::nQuant*::nValor),Nil})
	aadd(aLinha,{"C6_TES",T01->B1_TS,Nil})
	aadd(aItens,aLinha)	
		
	

	Mata410(aCabec,aItens,nOpc)

				If lMsErroAuto

					aErro := GetAutoGRLog()

					For nX := 1 To Len(aErro)
						cErroLog += aErro[nX] + Chr(13)+Chr(10)
					Next nX

					::Retorno:bERRO:=.T.
					::Retorno:cObs:=cErroLog

				Else
					::Retorno:bERRO:=.F.
					::Retorno:cObs:=cDoc
				Endif	
		
T01->(Dbclosearea())
Return(lRetorno)


Static Function EnviaMail(cEmail,cCC,cAssunto,cCorpo,_lJob)
Local aArea  := GetArea()
Local oServer
Local oMessage
Local nNumMsg := 0
Local nTam  := 0
Local nI  := 0
Local cCaixa := GetMv("MV_WFMLBOX")
Default cCC  := ""

dbselectarea("WF7")
dbsetorder(1)//WF7_FILIAL + WF7_PASTA
dbseek(xFilial("WF7")+ALLTRIM(cCaixa))
//Cria a conexão com o server STMP ( Envio de e-mail )
oServer := TMailManager():New()
oServer:Init( "", ALLTRIM(WF7->WF7_SMTPSR), ALLTRIM(WF7->WF7_CONTA),ALLTRIM(WF7->WF7_SENHA) , 0, WF7->WF7_SMTPPR )
//seta um tempo de time out com servidor de 1min
If oServer:SetSmtpTimeOut( WF7->WF7_TEMPO ) != 0
 ConOut( "Falha ao setar o time out" )
 Return .F.
EndIf
//realiza a conexão SMTP
If oServer:SmtpConnect() != 0
 ConOut( "Falha ao conectar" )
 If TMailManager():SMTPAuth(ALLTRIM(WF7->WF7_CONTA),ALLTRIM(WF7->WF7_SENHA)) != 0
  Return .F.
 Endif
EndIf
//Apos a conexão, cria o objeto da mensagem
oMessage := TMailMessage():New()
//Limpa o objeto
oMessage:Clear()
//Popula com os dados de envio
oMessage:cFrom   := WF7->WF7_ENDERE
oMessage:cTo   := cEmail
oMessage:cCc   := cCC
oMessage:cSubject  := cAssunto
oMessage:cBody   := cCorpo
/*
//Adiciona um attach
If oMessage:AttachFile( "arquivo.txt" ) < 0
 ConOut( "Erro ao atachar o arquivo" )
 Return .F.
Else
 //adiciona uma tag informando que é um attach e o nome do arq
 oMessage:AddAtthTag( 'Content-Disposition: attachment; filename=arquivo.txt')
EndIf
*/
//Envia o e-mail
nRet := oMessage:Send( oServer )
 If nRet != 0
 ConOut( "Erro ao enviar o e-mail - Cod: " + Str(nRet))
 ConOut( "Servidor : " + WF7->WF7_SMTPSR)
 ConOut( "Usuario : " + WF7->WF7_CONTA)
 ConOut( "Senha : " + WF7->WF7_SENHA)
 ConOut( "From : " + WF7->WF7_ENDERE)
 ConOut( "=======================" )
 Return .F.
EndIf

//Desconecta do servidor
If oServer:SmtpDisconnect() != 0
 ConOut( "Erro ao disconectar do servidor SMTP" )
 Return .F.
EndIf
RestArea(aArea)
Return .T.


return

