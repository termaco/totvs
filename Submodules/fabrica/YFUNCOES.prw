#Include 'Protheus.ch'
//Autor: Saulo Gomes Martins
//Data : 22/06/2013
//Descrição: funções para integração com Guberman
//TRATAMENTO PARA MOVIMENTO INTERNO MODELO 2
User Function ySD3Guberman(p_Acao,lErroStop)
Local oWs			:= YFWINT01():New()
Local nPosOSGub	:= aScan(aHeader,{|x| Alltrim(x[2])=="D3_YOSGUB"})
Local nPosCod		:= aScan(aHeader,{|x| Alltrim(x[2])=="D3_COD"})
Local nPosQuant	:= aScan(aHeader,{|x| Alltrim(x[2])=="D3_QUANT"})
Local nPosCusto	:= aScan(aHeader,{|x| Alltrim(x[2])=="D3_CUSTO1"})
Local nCont,cp_CodigoPeca
Local nCampoDelete := Len(aHeader)+1
If p_Acao=="C"	//O consultar ainda não existi
	Return .T.
EndIf
DbSelectArea("SB1")
DbSetOrder(1)
For nCont:=1 to Len(aCols)
	If !aCols[nCont][nCampoDelete] .and. !Empty(aCols[nCont][nPosOSGub])	//Campo com OS Guberman preenchido
		cp_CodigoPeca	:= POSICIONE("SB1",1,xFilial("SB1")+aCols[nCont][nPosCod],"B1_YCODINT")
		If !oWs:TrataPecaOS(p_Acao;						//p_Acao
						,aCols[nCont][nPosOSGub];	//np_NumeroOrdemServico
						,cp_CodigoPeca;				//cp_CodigoPeca
						,aCols[nCont][nPosQuant];	//np_QuantidadeRealizada
						,aCols[nCont][nPosCusto];	//np_CustoUnitarioRealizado
						,;								//np_CpfCnpjFornecedor
						,;								//np_NumeroNF
						,;								//cp_SerieNF
						,;								//cp_DataEmissaoNF
						)
			Aviso("YFUNCOES:ySD3Guberman","Erro, Produto:"+aCols[nCont][nPosCod]+"."+chr(13)+chr(10)+;
											" Mensagem:"+oWs:cWSErro+chr(13)+chr(10)+;
											" Verificar campos da integração Guberman",{"OK"})
			If lErroStop
				Return .F.
			EndIf
		EndIf
	EndIf
Next
Return .T.

//TRATAMENTO PARA ROTINA DE ENTRADA DE MERCADORIAS
User Function ySD1Guberman(p_Acao,lErroStop)
Local oWs			:= YFWINT01():New()
Local nPosOSGub	:= aScan(aHeader,{|x| Alltrim(x[2])=="D1_YOSGUB"})
Local nPosCod		:= aScan(aHeader,{|x| Alltrim(x[2])=="D1_COD"})
Local nPosQuant	:= aScan(aHeader,{|x| Alltrim(x[2])=="D1_QUANT"})
Local nPosCusto	:= aScan(aHeader,{|x| Alltrim(x[2])=="D1_CUSTO"})
Local nPosTes		:= aScan(aHeader,{|x| Alltrim(x[2])=="D1_TES"})
Local nPosTotal	:= aScan(aHeader,{|x| Alltrim(x[2])=="D1_TOTAL"})
Local cTesGub		:= GetMv("MV_YTESGUB")	//Produto
Local cSerGub		:= GetMv("MV_YSERGUB")	//Serviço
Local nCont,cp_CodigoPeca,np_CodigoServico,cCNPJFor
Local nCampoDelete := Len(aHeader)+1
If p_Acao=="C"	//O consultar ainda não existi
	Return .T.
EndIf
DbSelectArea("SB1")
DbSetOrder(1)
cCNPJFor			:= POSICIONE("SA2",1,xFilial("SA2")+M->cA100For+M->CLOJA,"A2_CGC")
For nCont:=1 to Len(aCols)
	If aCols[nCont][nCampoDelete]
		Loop
	ElseIf (aCols[nCont][nPosTes]$cTesGub .or. aCols[nCont][nPosTes]$cSerGub) .And. Empty(aCols[nCont][nPosOSGub])	//Campo com OS Guberman preenchido
		Aviso("YFUNCOES:ySD1Guberman|1","Erro, Produto:"+aCols[nCont][nPosCod]+"."+chr(13)+chr(10)+;
										" Mensagem: Preecher Campo Numero OS Guberman."+chr(13)+chr(10)+;
										" Verificar campos da integração Guberman",{"OK"})
		If lErroStop
			Return .F.
		EndIf
	ElseIf aCols[nCont][nPosTes]$cTesGub	//Produto
		cp_CodigoPeca		:= POSICIONE("SB1",1,xFilial("SB1")+aCols[nCont][nPosCod],"B1_YCODINT")
		If !oWs:TrataPecaOS(p_Acao;					//p_Acao
						,aCols[nCont][nPosOSGub];	//np_NumeroOrdemServico
						,cp_CodigoPeca;				//cp_CodigoPeca
						,aCols[nCont][nPosQuant];	//np_QuantidadeRealizada
						,aCols[nCont][nPosTotal];	//np_CustoUnitarioRealizado
						,cCNPJFor;						//np_CpfCnpjFornecedor
						,M->CNFISCAL;					//np_NumeroNF
						,M->CSERIE;					//cp_SerieNF
						,M->DDEMISSAO;					//cp_DataEmissaoNF
						)
			Aviso("YFUNCOES:ySD1Guberman|2","Erro, Produto:"+aCols[nCont][nPosCod]+"."+chr(13)+chr(10)+;
											" Mensagem:"+chr(13)+oWs:cWSErro+chr(13)+chr(10)+;
											" Verificar campos da integração Guberman",{"OK"})
			If lErroStop
				Return .F.
			EndIf
		EndIf
	ElseIf aCols[nCont][nPosTes]$cSerGub	//Serviço
		np_CodigoServico	:= POSICIONE("SB1",1,xFilial("SB1")+aCols[nCont][nPosCod],"B1_YCODINT")
		If !oWs:TrataServicoOS(p_Acao	;				//p_Acao
							,aCols[nCont][nPosOSGub];	//np_NumeroOrdemServico
							,np_CodigoServico;			//np_CodigoServico
							,M->DDEMISSAO;					//cp_DataRealizacao
							,cCNPJFor;						//np_CpfCnpjFornecedor
							,M->CNFISCAL;					//np_NumeroNF
							,M->CSERIE;					//cp_SerieNF
							,M->DDEMISSAO;					//cp_DataEmissaoNF
							,aCols[nCont][nPosTotal];	//np_ValorRealizado
							)
			Aviso("YFUNCOES:ySD1Guberman|3","Erro, Produto:"+aCols[nCont][nPosCod]+"."+chr(13)+chr(10)+;
											" Mensagem:"+oWs:cWSErro+chr(13)+chr(10)+;
											" Verificar campos da integração Guberman",{"OK"})
			If lErroStop
				Return .F.
			EndIf
		EndIf
	EndIf
Next
Return .T.

User Function yOsGurbem()
Local cQuery	:= ""
Local aCabec	//:= {"os","Item","Produto","Descricao","Dt Aluguel"}
Local aOrde	:= {"NR_ORDSERV"}
Local lRet
Local aRLinha	:= {}
cQuery	:= "SELECT * FROM VV_OS "
lRet	:= U_RConEsp(cQuery,aCabec,aOrde,1,"OS Guberman",/*{{"NR_ORDSERV","C",10,0}}*/)
If lRet
	U_RConEspX(@aRLinha)
EndIf
Return lRet