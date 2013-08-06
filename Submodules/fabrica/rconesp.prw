#INCLUDE 'TOTVS.CH'
#INCLUDE "DBSTRUCT.CH"
#INCLUDE "DBINFO.CH"
/*
//Autor: Saulo Gomes Martins
//Data : 05/12/2012
//Parametros:
	1(C,Obrigatorio)	- Query para montar tela
	2(A,Opcional)		- Titulos dos campos da Query (Exemplo: {"Cod","Descr","Quant"})
	3(A,Obrigatorio)	- Array com os campos Pesquisaveis na Query, usado também para ordena (Exemplo:{"B1_COD","B1_DESC"})
	4(N,Obrigatorio)	- Numero da Ordem do campo na query para Retorno na Tela
	5(C,Opcional)		- Texto descrição da Janela
Uso na Consulta Especifica.	Exemplo: u_RConEsp("SELECT B1_COD, B1_DESC FROM SB1010",,{"B1_COD"},1)
Para retorno usar função: u_RConEspX()
*/
Static xRet
Static aLinha
User Function RConEsp(_cQry,_aCabec,aOrde,nRet,cTitulo,_aQueryConv)
Local cCombo1			:= ""	//Combo do Ordem
Local _aOrdem			:= {}	//Textos do ordem
Local nCont
Local lRet				:= .F.
Local aArea			:= GetArea()
Default cTitulo		:= "Consulta"
Default _aCabec		:= {}
Default _aQueryConv	:= {}
Private cDesc			:= SPACE(100)
Private aCabec		:= _aCabec
Private cQry			:= _cQry
Private aQueryConv	:= _aQueryConv
Private oDlg,oCombo1,oTGet1
Private aItens
Private aOrdem		:= aOrde
Private oBrows
Private cCombo1
DbSelectArea("SX3")
DbSetOrder(2)
aLinha	:= {}
For nCont:=1 to Len(aOrdem)
	If SX3->(DbSeek(aOrdem[nCont]))	//Procura campo no SX3
		Aadd(_aOrdem,GetSx3Cache(aOrdem[nCont],"X3_TITULO"))
	Else	//Se não encontrou no SX3, deixa o texto com mesmo nome do campo
		Aadd(_aOrdem,aOrdem[nCont])
	EndIf
Next
cCombo1	:= aOrdem[1]

oDlg := MSDialog():New(000,000,400,650,cTitulo,,,,,CLR_BLACK,CLR_WHITE,,,.T.)
oDlg:lMaximized := .F.
oFWLayer := FWLayer():New()
oFWLayer:Init( oDlg, .F., .T. )
oFWLayer:AddLine( 'TOP1', 10, .F. )
oFWLayer:AddLine( 'TOP2', 85, .F. )
oFWLayer:AddLine( 'TOP3', 5,  .F. )
oPanelTop1 := oFWLayer:getLinePanel( 'TOP1' )
oPanelTop2 := oFWLayer:getLinePanel( 'TOP2' )
oPanelTop3 := oFWLayer:getLinePanel( 'TOP3' )

oCombo1 := TComboBox():New(01,227,{|u|if(PCount()>0,cCombo1:=u,cCombo1)},;
                    _aOrdem,090,20,oPanelTop1,,{|| RCombo() };
                    ,,,,.T.,,,,,,,,,'cCombo1')
If SX3->(DbSeek(aOrdem[oCombo1:nAt]))	//Procura campo no SX3
	cDesc	:=PadR("",GetSx3Cache(aOrdem[oCombo1:nAt],"X3_TAMANHO"))
Else
	cDesc	:= Space(100)
EndIf
oTGet1	:= TGet():New( 01,005,{|u|if(Pcount()>0,(cDesc:=u,Atualizar(),oBrows:GoPosition(1)),cDesc)},oPanelTop1,219,009,;
          GetSx3Cache(aOrdem[oCombo1:nAt],"X3_PICTURE"),,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cDesc,,,, )
aItens						:= MontarArray()
oBrows	:= TcBrowse():New( 031,003,318,159,,aCabec,,oPanelTop2,/*cField*/,/*cTopFun*/,/*cBotFun*/,{||  },/*bViewReg*/,,,,,,, .F.,/*"TRB"*/, .T.,, .F., , ,.f. )
oBrows:align				:= CONTROL_ALIGN_ALLCLIENT

oBrows:nScrollType 		:= 0
oBrows:SetArray(aItens)
oBrows:bLine 				:= { || aItens[ oBrows:nAT ] }
oBrows:bLDblClick 		:= { || aLinha	:= aItens[oBrows:nAT],xRet	:= aItens[oBrows:nAT][nRet],lRet:=.T.,oDlg:End() }
oTGet1:SetFocus()

oTButton1 := TButton():Create( oPanelTop3,01,01,"Confirmar",{|| aLinha	:= aItens[oBrows:nAT],xRet	:= aItens[oBrows:nAT][nRet],lRet:=.T.,oDlg:End() },40,10,,,,.T.,,,,,,)
oTButton2 := TButton():Create( oPanelTop3,01,45,"Cancelar",{||oDlg:End() },40,10,,,,.T.,,,,,,)
// Ativa diálogo centralizado
oDlg:Activate(,,,.T., )
RestArea(aArea)
If ValType(xRet)=="C" .AND. xRet=="-"
	lRet	:= .F.
EndIf
Return(lRet)

User Function RConEspX(aRLinha)
aRLinha	:= aLinha
Return xRet
Static Function RCombo()
SX3->(DbSetOrder(2))
If SX3->(DbSeek(aOrdem[oCombo1:nAt]))	//Procura campo no SX3
	oTGet1:Picture	:= GetSx3Cache(aOrdem[oCombo1:nAt],"X3_PICTURE")
	cDesc				:= PadR("",GetSx3Cache(aOrdem[oCombo1:nAt],"X3_TAMANHO"))
Else
	oTGet1:Picture	:= ""
	cDesc				:= Space(100)
EndIf
oTGet1:CtrlRefresh()
Atualizar()
oBrows:GoPosition(1)
Return

Static Function Atualizar()
	aItens	:= MontarArray()
	oBrows:SetArray(aItens)
	oBrows:ResetLen()
	oBrows:bLine := { || aItens[ oBrows:nAT ] }
	oBrows:Refresh()
	Eval(oBrows:bChange)
	oBrows:Refresh()
Return

Static function MontarArray()
Local aArray	:= {}
Local _cQuery
Local nTamArray
Local nCont
Local cCampo
Local xValor
_cQuery := "SELECT * FROM ("+cQry+") TABTMP "
If !Empty(cDesc)
	_cQuery += "WHERE "+aOrdem[oCombo1:nAt]+" LIKE '"+RTrim(cDesc)+"%'"
EndIf
_cQuery += " ORDER BY "+aOrdem[oCombo1:nAt]
__ExecSql("TMPARRAY",_cQuery,aQueryConv,.T.)
While TMPARRAY->(!EOF())		//Monta o array de dados
	AADD(aArray,{})
	nTamArray	:= Len(aArray)
	For nCont:=1 to TMPARRAY->(DBInfo(DBI_FCOUNT))
		xValor	:= TMPARRAY->(&(DBFIELDINFO(DBS_NAME,nCont)))
		AADD(aArray[nTamArray],xValor)
	Next
	TMPARRAY->(DbSkip())
EndDo
If Empty(aArray)				//Se fazio envia um array informando sem dados
	AADD(aArray,{})
	nTamArray	:= Len(aArray)
	For nCont:=1 to TMPARRAY->(DBInfo(DBI_FCOUNT))
		AADD(aArray[nTamArray],"-")
	Next
	aArray[nTamArray][1]	:= "Sem dados!"
EndIf
SX3->(DbSetOrder(2))
If Empty(aCabec)				//Se não enviado cabeçario, monta a parti do SX3
	For nCont:=1 to TMPARRAY->(DBInfo(DBI_FCOUNT))
		cCampo	:= DBFIELDINFO(DBS_NAME,nCont)
		If SX3->(DbSeek(cCampo))	//Procura campo no SX3
			AADD(aCabec,GetSx3Cache(cCampo,"X3_TITULO"))
		Else
			AADD(aCabec,cCampo)
		EndIf
	Next
EndIf
TMPARRAY->(DbCloseArea())
Return aArray