#INCLUDE "Rwmake.ch"
#INCLUDE "Protheus.ch"
#INCLUDE "Topconn.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ MT120FIM    ºAutor  ³ Karlos Morais   º Data ³  13/07/12   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Ponto de Entrada que trata de separa o Pedido quando houverº±±
±±º          ³ mais de um Grupo de Aprovador, separando os Pedidos por    º±±
±±º          ³ Grupo de Aprovador.                                        º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Beach Park                                                 º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
ALTERAÇÕES : 
	SAULO GOMES MARTINS 23/03/2013
	TRATAR PEDIDO COM COTAÇÃO
*/

User Function MT120FIM

	Local cPedido	:= PARAMIXB[2]
	Local lInclui	:= IF(PARAMIXB[1]==3.AND.PARAMIXB[3]==1,.T.,.F.)	//incluir e não cancelou
	Local nCount	:= 0
	
	Private cAlias	:= getNextAlias()
	Private cAliasInc := getNextAlias()
	Private aDados	:= {}

	If lInclui	//VER SE O PEDIDO TEM MAIS DE UM CENTRO DE CUSTO
		BeginSql Alias cAlias
			SELECT 
				COUNT(CTT.CTT_YGPRES) as Qtd
			FROM %table:SC7% SC7
				LEFT JOIN %table:CTT% CTT 
				ON CTT.CTT_FILIAL			= %xFilial:CTT%
					AND CTT.CTT_CUSTO		= SC7.C7_CC
					AND CTT.%notDel%
			WHERE SC7.C7_FILIAL			= %xFilial:SC7%
				and SC7.C7_NUM 			= %Exp:cPedido%
				and SC7.%notDel% 
			GROUP BY
				CTT.CTT_YGPRES
		EndSql
		
		//(cAlias)->(dbGoTop())
		
		While !(cAlias)->(Eof())
			nCount := nCount+1
			(cAlias)->(dbSkip())
		EndDo
		
		(cAlias)->(dbCloseArea())
		BeginTran()
		If nCount > 1
			CriaDados(cPedido)	//Cria informações para dividir o pedido
			If ExclSC7(cPedido)		//Exclui o pedido original
				CriaSC7(cPedido)		//Cria novos pedidos com base no original
			EndIf
		EndIf
		EndTran()
	EndIf
	
Return

Static Function CriaDados(cPedido)
	Local aCab		:= {}
	Local aItem		:= {}
	Local cGrupo	:= ""
	Local aUPDSC8	:= {}
	Local cCotacao	:= ""
	If Type("cNumCotacao")<>"U"	
		cCotacao	:= cNumCotacao
	EndIf
BeginSql Alias cAliasInc
	SELECT 
		SC7.*,
		CTT.CTT_YGPRES
	FROM %table:SC7% SC7
		LEFT JOIN %table:CTT% CTT 
		ON
		CTT.CTT_FILIAL = %xFilial:CTT%  
		AND CTT.CTT_CUSTO = SC7.C7_CC
		AND CTT.%notDel%
	WHERE 
		C7_FILIAL = %xFilial:SC7% 
		AND C7_NUM = %Exp:cPedido%
		AND SC7.%notDel%
	ORDER BY
		SC7.C7_FILIAL,
		SC7.C7_NUM,
		CTT.CTT_YGPRES,
		SC7.C7_ITEM
EndSql

While !(cAliasInc)->(Eof())

aCab := {	;
			{"C7_NUM"	,CriaVar('C7_NUM', .T.)		,Nil},;
			{"C7_FORNECE"	,(cAliasInc)->C7_FORNECE		,Nil},;
			{"C7_LOJA"		,(cAliasInc)->C7_LOJA			,Nil},;
			{"C7_EMISSAO"	,STOD((cAliasInc)->C7_EMISSAO)	,Nil},;
			{"C7_COND"		,(cAliasInc)->C7_COND			,Nil},;
			{"C7_CONTATO"	,(cAliasInc)->C7_CONTATO		,Nil},;
			{"C7_FILENT"	,(cAliasInc)->C7_FILENT			,Nil},;
			{"C7_MOEDA"	,(cAliasInc)->C7_MOEDA			,Nil},;
			{"C7_TXMOEDA"	,(cAliasInc)->C7_TXMOEDA		,Nil},;
			{"C7_NUMCOT"	,(cAliasInc)->C7_NUMCOT			,Nil};
			}
	
cGrupo	:= (cAliasInc)->CTT_YGPRES 	 
aItem	:= {}
aUPDSC8:={}

	While !(cAliasInc)->(Eof()) .AND. cGrupo == (cAliasInc)->CTT_YGPRES
	
		aAdd(aItem,{	{"C7_PRODUTO"	,(cAliasInc)->C7_PRODUTO		,Nil},;
					{"C7_UM"		,(cAliasInc)->C7_UM				,Nil},;
					{"C7_CODTAB"	,(cAliasInc)->C7_CODTAB			,Nil},;
					{"C7_QUANT"		,(cAliasInc)->C7_QUANT			,Nil},;
					{"C7_PRECO"		,(cAliasInc)->C7_PRECO			,Nil},;
					{"C7_TOTAL"		,(cAliasInc)->C7_TOTAL			,Nil},;
					{"C7_IPI"		,(cAliasInc)->C7_IPI			,Nil},;
					{"C7_DATPRF"	,STOD((cAliasInc)->C7_DATPRF)	,Nil},;
					{"C7_LOCAL"		,(cAliasInc)->C7_LOCAL			,Nil},;
					{"C7_OBS"		,(cAliasInc)->C7_OBS			,Nil},;
					{"C7_CC"		,(cAliasInc)->C7_CC				,Nil},;
					{"C7_CONTA"		,(cAliasInc)->C7_CONTA			,Nil},;
					{"C7_ITEMCTA"	,(cAliasInc)->C7_ITEMCTA		,Nil},;
					{"C7_RESIDUO"	,(cAliasInc)->C7_RESIDUO		,Nil},;
					{"C7_IPIBRUT"	,(cAliasInc)->C7_IPIBRUT		,Nil},;
					{"C7_VLDESC"	,(cAliasInc)->C7_VLDESC			,Nil},;
					{"C7_FLUXO"		,(cAliasInc)->C7_FLUXO			,Nil},;
					{"C7_VALIPI"	,(cAliasInc)->C7_VALIPI			,Nil},;
					{"C7_VALICM"	,(cAliasInc)->C7_VALICM			,Nil},;
					{"C7_TES"		,(cAliasInc)->C7_TES			,Nil},;
					{"C7_DESC"		,(cAliasInc)->C7_DESC			,Nil},;
					{"C7_PICM"		,(cAliasInc)->C7_PICM			,Nil},;
					{"C7_BASEICM"	,(cAliasInc)->C7_BASEICM		,Nil},;
					{"C7_BASEIPI"	,(cAliasInc)->C7_BASEIPI		,Nil},;
					{"C7_PENDEN"	,(cAliasInc)->C7_PENDEN			,Nil},;
					{"C7_CLVL"		,(cAliasInc)->C7_CLVL			,Nil},;
					{"C7_ICMCOMP"	,(cAliasInc)->C7_ICMCOMP		,Nil},;
					{"C7_ICMSRET"	,(cAliasInc)->C7_ICMSRET		,Nil},;
					{"C7_ESTOQUE"	,(cAliasInc)->C7_ESTOQUE		,Nil},;
					{"C7_RATEIO"	,(cAliasInc)->C7_RATEIO			,Nil},;
					{"C7_FILCEN"	,(cAliasInc)->C7_FILCEN			,Nil},;
					{"C7_ACCPROC"	,EhEmpty((cAliasInc)->C7_ACCPROC,CriaVar("C7_ACCPROC"))		,Nil},;
					{"C7_QUJE"		,(cAliasInc)->C7_QUJE			,Nil},;
					{"C7_REAJUST"	,EhEmpty((cAliasInc)->C7_REAJUST,CriaVar("C7_ACCPROC"))		,Nil},;
					{"C7_FRETE"	,(cAliasInc)->C7_FRETE			,Nil},;
					{"C7_EMITIDO"	,(cAliasInc)->C7_EMITIDO		,Nil},;
					{"C7_TPFRETE"	,(cAliasInc)->C7_TPFRETE		,Nil},;
					{"C7_QTDSOL"	,(cAliasInc)->C7_QTDSOL			,Nil},;
					{"C7_SEQMRP"	,(cAliasInc)->C7_SEQMRP			,Nil},;
					{"C7_POLREPR"	,(cAliasInc)->C7_POLREPR		,Nil},;
					{"C7_PERREPR"	,(cAliasInc)->C7_PERREPR		,Nil},;
					{"C7_GRADE"		,(cAliasInc)->C7_GRADE			,Nil},;
					{"C7_ITEMGRD"	,(cAliasInc)->C7_ITEMGRD		,Nil},;
					{"C7_CODED"		,(cAliasInc)->C7_CODED			,Nil},;
					{"C7_NUMPR"		,(cAliasInc)->C7_NUMPR			,Nil},;
					{"C7_NUMSC"		,(cAliasInc)->C7_NUMSC			,Nil},;
					{"C7_ITEMSC"	,(cAliasInc)->C7_ITEMSC			,Nil},;
					{"C7_NUMCOT"	,(cAliasInc)->C7_NUMCOT			,Nil};
					})
		AADD(aUPDSC8,{(cAliasInc)->C7_NUM,(cAliasInc)->C7_ITEM,(cAliasInc)->C7_NUMCOT,aCab[1][2]})
		(cAliasInc)->(dbSkip())
		
	EndDo
	AADD(aDados,{aCab,aItem,aUPDSC8})

EndDO
//TRATAMENTO PARA AMARRA O PEDIDO A COTAÇÃO JÁ EXISTENTE
For nCont1:=1 to Len(aDados)
	aUPDSC8:= aDados[nCont1][3]
	For nCont:=1 to Len(aUPDSC8)
		If !Empty(aUPDSC8[nCont][3])
			If TCSQLExec("UPDATE "+RETSQLNAME("SC7")+" SET C7_NUMCOT='"+SPACE(GetSx3Cache("C7_NUMCOT","X3_TAMANHO"))+"' WHERE C7_FILIAL='"+xFilial("SC7")+"' AND C7_NUM='"+aUPDSC8[nCont][1]+"' AND D_E_L_E_T_=' '")<0
				Alert("Erro na atualização do pedido de compra")
			EndIf
			//If TCSQLExec("UPDATE "+RETSQLNAME("SC1")+" SET C1_PEDIDO='"+SPACE(GetSx3Cache("C1_PEDIDO","X3_TAMANHO"))+"', C1_ITEMPED='"+SPACE(GetSx3Cache("C1_ITEMPED","X3_TAMANHO"))+"' WHERE C1_FILIAL='"+xFilial("SC1")+"' AND C1_PEDIDO='"+aUPDSC8[nCont][1]+"' AND D_E_L_E_T_=' '")<0
			//	Alert("Erro na atualização da solicitação de compra")
			//EndIf
		EndIf
	Next
Next
(cAliasInc)->(dbCloseArea())
Return

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ CriaSC7     ºAutor  ³ Karlos Morais   º Data ³  13/07/12   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Cria Pedido de Compra                                      º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Beach Park : MT120GOK                                      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static Function CriaSC7(cPedido)

	Local aCab		:= {}
	Local aItem		:= {}
	Local cGrupo	:= ""
	Local aUPDSC8	:= {}
	Local nCont
	
	Private lMsHelpAuto		:= .T.
	Private lAutoErrNoFile	:= .F.
	Private lMsErroAuto		:= .F.
 
	//(cAliasInc)->(dbGoTop())
	
	For nCont1:=1 to Len(aDados)
		aCab	:= aDados[nCont1][1]
		aItem	:= aDados[nCont1][2]
		aUPDSC8:= aDados[nCont1][3]

		//MSExecAuto({|v,x,y,z| MATA120(v,x,y,z)},1,aCab,aItem,3)
		MATA120(1,aCab,aItem,3,.F.)
		
		If lMsErroAuto
			lErro := .T.
			RollbackSX8()
			DisarmTransaction()
			MostraErro()
			Return
		Else
			//TRATAMENTO PARA AMARRA O PEDIDO A COTAÇÃO JÁ EXISTENTE
			For nCont:=1 to Len(aUPDSC8)
				If !Empty(aUPDSC8[nCont][3])
					If TCSQLExec("UPDATE "+RETSQLNAME("SC8")+" SET C8_NUMPED='"+aUPDSC8[nCont][4]+"', C8_ITEMPED='"+STRZERO(nCont,GetSx3Cache("C7_ITEM","X3_TAMANHO"))+"' WHERE C8_FILIAL='"+xFilial("SC8")+"' AND C8_NUMPED='"+aUPDSC8[nCont][1]+"' AND C8_ITEMPED='"+aUPDSC8[nCont][2]+"' AND D_E_L_E_T_=' '")<0
						Alert("Erro na atualização da cotação")
					EndIf
					If TCSQLExec("UPDATE "+RETSQLNAME("SC1")+" SET C1_COTACAO='"+aUPDSC8[nCont][3]+"'  WHERE C1_FILIAL='"+xFilial("SC1")+"' AND C1_PEDIDO='"+aUPDSC8[nCont][4]+"' AND C1_ITEMPED='"+STRZERO(nCont,GetSx3Cache("C7_ITEM","X3_TAMANHO"))+"' AND D_E_L_E_T_=' '")<0
						Alert("Erro na atualização da solicitação de compra")//C1_PEDIDO='"+aUPDSC8[nCont][4]+"', C1_ITEMPED='"+STRZERO(nCont,GetSx3Cache("C7_ITEM","X3_TAMANHO"))+"',
					EndIf
					If TCSQLExec("UPDATE "+RETSQLNAME("SC7")+" SET C7_NUMCOT='"+aUPDSC8[nCont][3]+"' WHERE C7_FILIAL='"+xFilial("SC7")+"' AND C7_NUM='"+aUPDSC8[nCont][4]+"' AND D_E_L_E_T_=' '")<0
						Alert("Erro na atualização do pedido de compra")
					EndIf
				EndIf
			Next
			aCab := {}
			If ( __lSx8 )
				ConfirmSX8()
			EndIf
		EndIf
		
	Next
	
Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³ CriaSC7     ºAutor  ³ Karlos Morais   º Data ³  13/07/12   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Exclui Pedido de Compra                                    º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Beach Park : MT120GOK                                      º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static Function ExclSC7(cPedido)

	Local aCab	:= {}
	Local aItem	:= {}
	Local lret	:= .T.
	
	Private lMsHelpAuto		:= .T.
	Private lAutoErrNoFile	:= .F.
	Private lMsErroAuto		:= .F.

		aCab := {	{"C7_NUM"		,cPedido			,Nil},;
					{"C7_FILIAL"	,xFilial("SC7")	,Nil}}
		
	
	MSExecAuto({|v,x,y,z| MATA120(v,x,y,z)},1,aCab,aItem,5)
		
	If lMsErroAuto
		lErro := .T.
		lret	:= .F.
		DisarmTransaction()
		MostraErro()
	EndIf	
	
Return lret

Static Function EhEmpty(cValor1,cValor2)
Return If(Empty(cValor1),cValor2,cValor1)