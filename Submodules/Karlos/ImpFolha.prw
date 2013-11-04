#INCLUDE "PROTHEUS.CH"
#INCLUDE "APWIZARD.CH"

// #########################################################################################
// Projeto:
// Modulo :
// Fonte  : Import
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor             | Descricao
// ---------+-------------------+-----------------------------------------------------------
// 28/06/13 | Karlos Morais     | Programa responsavel para importação de dados das tabelas
//          |                   |   - Funções (SRJ - GPEA030)
//          |                   |   - Funcionario (SRA - GPEA010)
//          |                   |   - Dependentes (SRB - GPEA020)
//          |                   |   - Beneficiarios (SRQ - GPEA280)
//          |                   |   - Programação de Ferias (SRF - GPEA050)
//          |                   |   - Afastamento (SR8 - GPEA240)
//          |                   |   - Historico de Salario (SR7 - GPEA250)
//          |                   |   - Acumulados (SRD - GPEA120)
// ---------+-------------------+-----------------------------------------------------------
// #########################################################################################

User Function ImpFolha

	// ######################################################
	//		Variaveis
	// ######################################################

	Local oWizard
	Local nMetGlob
	Local nMetParc
	Local oRadioArq
	Local nRadioArq	:= 1
	Local cText
	Local cFile		:= Replicate( " ", 80 )  
	Local cHeader 	:= "Importação de dados"
	Local cTpArq	:= "Delimitado (*.csv)|*.CSV|"
	Local cDelim	:= AllTrim(SuperGetMV("MV_TPDELI",.F.,';'))
	Local nLinCabec	:= 1	// Padrão sem linha de cabeçalho
	Local cCabec	:= ""	// String com o cabeçalho do arquivo original, se houver
	Local nQtdCab	:= 1	// String com o cabeçalho do arquivo original, se houver
	Local cNmAlias	:= "Funções (SRJ)"
	Local cTipo		:= "1"

	Private INCLUI	:= .T.
	Private ALTERA	:= .F.

	cText 	:= 	 "Esta rotina tem por objetivo importar registros, através " + ;
				 "de um arquivo padrão CSV (delimitado) , e armazena-los na tabela "+ ;
				 "correspondente do sistema."+ CRLF + ;
				 "Os nomes das colunas devem ser os mesmos nomes de campos a serem atualizados."+ CRLF + CRLF + ;
				 "Ao final da importação será gerado um arquivo de log contendo as "+ ;
				 "inconsistências."

	// ######################################################
	//		Primeiro Painel - Abertura
	// ######################################################

	DEFINE WIZARD oWizard		TITLE "Importação de dados" ;
								HEADER cHeader ;
								MESSAGE "Apresentação." ;
								TEXT cText ;
								NEXT { || .T. } ;
								FINISH {|| .T.} PANEL 

	// ######################################################
	//		Segundo Painel - Arquivo e Contrato
	// ######################################################

	CREATE PANEL oWizard 	HEADER cHeader ;
							MESSAGE "Selecione os tabela que deseja importar" ;
							BACK {|| .T. } ;
							NEXT {|| .T. } ;
							FINISH {|| .F. } ;
							PANEL

	oPanel := oWizard:GetPanel( 2 )

	@ 15, 08 GROUP oGrpCon 	TO 120, 230 LABEL "Cadastro a ser importado" OF oPanel PIXEL DESIGN

	@ 25,35 Radio oRadioArq Var nRadioArq Items	"Funções (SRJ - GPEA030)",;
												"Funcionario (SRA - GPEA010)",;
												"Dependentes (SRB - GPEA020)",;
												"Beneficiarios (SRQ - GPEA280)",;
												"Programação de Ferias (SRF - GPEA050)",;
												"Afastamento (SR8 - GPEA240)",;
												"Historico de Salario (SR7 - GPEA250)",;
												"Acumulados (SRD - GPEA120)",;
												"Histórico Valores Salariais (SR3)";
												3D 	Size 170,10 Of oPanel PIXEL DESIGN ;
												ON CHANGE ImpChgRadio(nRadioArq,@cNmAlias)														


	// ######################################################
	//		Segundo Painel - Arquivo e Contrato
	// ######################################################

	CREATE PANEL oWizard 	HEADER cHeader ;
							MESSAGE "Selecione o arquivo para importação." ;
							BACK {|| .T. } ;
							NEXT {|| ! empty( cDelim ) .and. ! empty( cFile ) } ;
							FINISH {|| .F. } ;
							PANEL

	oPanel := oWizard:GetPanel( 3 )

	@ 10, 08 GROUP oGrpCon 	TO 40, 280 LABEL "Selecione um arquivo." ;
								OF oPanel ;
								PIXEL ;
								DESIGN

	@ 20, 15 MSGET oArq 	VAR cFile WHEN .F. OF oPanel SIZE 140, 10 PIXEL ;
							MESSAGE "Utilize o botão ao lado para selecionar" ;

	DEFINE SBUTTON oButArq 	FROM 21, 160 ;
								TYPE 14 ;
								ACTION cFile := cGetFile(cTpArq, , 0, "SERVIDOR\", .T., GETF_LOCALHARD + GETF_NETWORKDRIVE) ;
								OF oPanel ;
								ENABLE


	@ 50, 08 GROUP oGrpCon 	TO 130, 280 LABEL "Informe as configurações do arquivo." ;
								OF oPanel ;
								PIXEL ;
								DESIGN

  	@ 60,20 SAY "Delimitador" OF oPanel SIZE 35,8 PIXEL
	@ 60,60 MSGET oDelim	VAR cDelim  ;
							PICTURE "@!" ;
							VALID !empty(cDelim) ;
							MESSAGE "Informe um delimitador de campo." ;
							OF oPanel SIZE 10,8 PIXEL

  	@ 80,20 SAY "Tipo" OF oPanel SIZE 35,8 PIXEL
	@ 80,60 COMBOBOX oTipo Var cTipo ITEMS {"1=Somente Log","2=Log + Importação"} SIZE 200,010 OF oPanel PIXEL

	// ######################################################
	//		Terceiro Painel - Confirmacao  / Processamento
	// ######################################################

	CREATE PANEL oWizard 	HEADER cHeader ;
							MESSAGE "Confirmação dos dados e início de processamento." ;
							BACK {|| .T. } ;
							NEXT {|| .T. } ;
							FINISH {|| .F. } ;
							PANEL

	oPanel := oWizard:GetPanel( 4 )

	@ 010, 010 SAY "Arquivo" OF oPanel SIZE 140, 8 PIXEL
	@ 010, 050 SAY cFile  OF oPanel SIZE 140, 8 COLOR CLR_HBLUE PIXEL

	@ 030, 010 SAY  "Delimitador" OF oPanel SIZE 140, 8 PIXEL
	@ 030, 050 SAY  cDelim  OF oPanel SIZE 140, 8 COLOR CLR_HBLUE PIXEL


	@ 050, 010 SAY  "Alias" OF oPanel SIZE 140, 8 PIXEL
	@ 050, 050 SAY  cNmAlias  OF oPanel SIZE 140, 8 COLOR CLR_HBLUE PIXEL


	@ 070, 010 SAY  "Tipo Proc.:" OF oPanel SIZE 140, 8 PIXEL
	@ 070, 050 SAY  IIf(cTipo=="1","Somente Log","Log+Importação")  OF oPanel SIZE 140, 8 COLOR CLR_HBLUE PIXEL


	// ######################################################
	//		Quarto Painel - Processamento
	// ######################################################

	CREATE PANEL oWizard 	HEADER cHeader ;
							MESSAGE "Processamento da Importação." ;
							BACK {|| .F. } ;
							NEXT {|| .T. } ;
							FINISH {|| .T. } ;
							EXEC {|| CursorWait(), IMPCADPro( oMetGlob, nRadioArq, cFile, cDelim, cTipo ), CursorArrow() } ;
							PANEL

	oPanel := oWizard:GetPanel( 5 )

	@ 25, 30 SAY "Importação" OF oPanel SIZE 140, 8 PIXEL
	@ 40, 30 METER oMetGlob 	VAR nMetGlob ;
								TOTAL 100 ;
								SIZE 224,10 OF oPanel PIXEL UPDATE DESIGN ;
								BARCOLOR CLR_BLACK,CLR_WHITE ;
								COLOR CLR_WHITE,CLR_BLACK ;
							 	NOPERCENTAGE

	ACTIVATE WIZARD oWizard CENTER

Return NIL


// #########################################################################################
// Programa  : Import
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor             | Descricao
// ---------+-------------------+-----------------------------------------------------------
// 28/06/13 | Karlos Morais     |
// ---------+-------------------+-----------------------------------------------------------
// #########################################################################################

Static Function IMPCADPro( oMetGlob, nRadioArq, cFile, cDelim,cTipo )

	// ######################################################
	//		Declaracao de Variaveis
	// ######################################################

	Local aArea		:= GetArea()
	Local lFirst	:= .T.
	Local cLinha 	:= ""
	Local aHeader	:= {}
	Local nHdl		:= 	0
	Local cEnvServ	:= GetEnvServer()
	Local cIniFile	:= GetADV97()
	Local cEnd		:= GetPvProfString(cEnvServ,"StartPath","",cIniFile)
	Local cDtHr		:= DtoS(dDataBase)+"-"+Substr(time(),1,2)+"-"+Substr(time(),4,2)+"-"+Substr(time(),7,2)
	Local cPath		:= "\IMPORT\"
	Local cTipoLog	:= "Import_"
	Local cNomeLog	:=	cPath+cTipoLog+cDtHr+"_Log.txt"
	Local cArq		:=	cEnd+cNomeLog
	Local cLin		:= ""
	Local cCdAlias	:= ""
	Local nQtReg	:= 0
	Local nQtNOk	:= 0
	Local nQtOk		:= 0
	Local aLog		:= {}
	Local lGrava	:= (cTipo == "2")
	Local cRotina	:= ""
	Local nCont		:= 0

	MAKEDIR(cEnd+cPath)

	// ######################################################
	//		Validacao do arquivo para importacao
	// ######################################################

	If !File(cFile) .OR. Empty(cFile)
		ApMsgStop("Problemas com arquivo informado!")
		RestArea(aArea)
		Return
	EndIf

	// ######################################################
	//		Identifica Alias de importacao
	// ######################################################

	Do Case
		Case nRadioArq == 1		// Funções (SRJ - GPEA030)
			cCdAlias	:= "SRJ"
			cRotina	:= "GPEA030"

		Case nRadioArq == 2		// Funcionario (SRA - GPEA010)
			cCdAlias	:= "SRA"
			cRotina	:= "GPEA010"

		Case nRadioArq == 3		// Dependentes (SRB - GPEA020)
			cCdAlias	:= "SRB"
			cRotina	:= "GPEA020"

		Case nRadioArq == 4		// Beneficiarios (SRQ - GPEA280)
			cCdAlias	:= "SRQ"
			cRotina	:= "GPEA280"

		Case nRadioArq == 5		// Programação de Ferias (SRF - GPEA050)
			cCdAlias	:= "SRF"
			cRotina	:= "GPEA050"
			
		Case nRadioArq == 6		// Afastamento (SR8 - GPEA240)
			cCdAlias	:= "SR8"
			cRotina	:= "GPEA240"
			
		Case nRadioArq == 7		// Historico de Salario (SR7 - GPEA250)
			cCdAlias	:= "SR7"
			cRotina	:= "GPEA250"
			
		Case nRadioArq == 8		// Acumulados (SRD - GPEA120)
			cCdAlias	:= "SRD"
			cRotina	:= "GPEA120"
			
		Case nRadioArq == 9
			cCdAlias	:= "SR3"	
			cRotina	:= "GPEA250"   

		OtherWise
			ApMsgStop("Nao existe tratamento para importação deste tipo de arquivo!")
			Return
	EndCase

	// ######################################################
	//		Inicia Log
	// ######################################################

	AAdd(aLog, Replicate( '=', 80 ) )
	AAdd(aLog, 'INICIANDO O LOG - I M P O R T A C A O   D E   D A D O S' )
	AAdd(aLog, Replicate( '-', 80 ) )
	AAdd(aLog, 'DATABASE...........: ' + DtoC( dDataBase ) )
	AAdd(aLog, 'DATA...............: ' + DtoC( Date() ) )
	AAdd(aLog, 'HORA...............: ' + Time() )
	AAdd(aLog, 'ENVIRONMENT........: ' + GetEnvServer() )
	AAdd(aLog, 'PATCH..............: ' + GetSrvProfString( 'StartPath', '' ) )
	AAdd(aLog, 'ROOT...............: ' + GetSrvProfString( 'RootPath', '' ) )
	AAdd(aLog, 'VERSÃO.............: ' + GetVersao() )
	AAdd(aLog, 'MÓDULO.............: ' + 'SIGA' + cModulo )
	AAdd(aLog, 'EMPRESA / FILIAL...: ' + SM0->M0_CODIGO + '/' + SM0->M0_CODFIL )
	AAdd(aLog, 'NOME EMPRESA.......: ' + Capital( Trim( SM0->M0_NOME ) ) )
	AAdd(aLog, 'NOME FILIAL........: ' + Capital( Trim( SM0->M0_FILIAL ) ) )
	AAdd(aLog, 'USUÁRIO............: ' + SubStr( cUsuario, 7, 15 ) )
	AAdd(aLog, 'TABELA IMPORT......: ' + cCdAlias )
	AAdd(aLog, 'ARQUIVO IMPORT.....: ' + cFile )
	AAdd(aLog, 'DELIMITADOR........: ' + cDelim )
	AAdd(aLog, 'MODO PROCESSAMENTO.: ' + IIf(lGrava,"Atualizacao","Simulacao") )
	AAdd(aLog, Replicate( ':', 80 ) )
	AAdd(aLog, '' )

	AAdd(aLog, "Import = INICIO - Data "+DtoC(dDataBase)+ " as "+Time() )

	// ######################################################
	//		Leitura do arquivo
	// ######################################################

	FT_FUSE(cFile)

	nTot	:= FT_FLASTREC()
	nAtu	:= 0

	oMetGlob:SetTotal(nTot)
	CursorWait()

	FT_FGOTOP()

	While !FT_FEOF()

		nAtu++
		oMetGlob:Set(nAtu)

		cLinha := LeLinha() //FT_FREADLN()

		If Empty(cLinha)
			FT_FSKIP()
			Loop
		EndIf

		// ######################################################
		//		Tratamento de colunas
		// ######################################################

		aCols	:= {}
		aCols	:= TrataCols(cLinha,cDelim)

		If lFirst

			aHeader := aClone(aCols)
			lFirst := .F.

			// ######################################################
			//		Valida nomes das colunas
			// ######################################################

			cCpos := ImpVldCols(cCdAlias,aHeader)

			If !Empty(cCpos)
				ApMsgStop("Problemas na estrutura do arquivo, faltam as seguintes colunas "+cCpos)
				Return
			EndIf

		Else

			nQtReg++

			// ######################################################
			//		Validacao de campos obrigatorios
			// ######################################################

			cMsg := ImpObrigat(cCdAlias,aCols,aHeader)

			If !Empty(cMsg)
				AtuLog("NO MOT: CAMPOS OBRIGATORIOS - REGISTRO IGNORADO - "+cMsg,@aLog,nAtu)
				nQtNOk++
				FT_FSKIP()
				Loop
			EndIf

			// ######################################################
			//		Chamada de rotina automatica de inclusao
			// ######################################################

			If lGrava

				aRet := {}
				aRet := ImpGrava(cCdAlias,cRotina,aCols,aHeader)

				If aRet[1]
					nQtOk++
					AtuLog("OK MOT:REGISTRO INCLUIDO"+aRet[2],@aLog,nAtu)
				Else
					AtuLog("NO MOT: PROBLEMAS NA GRAVACAO ROTINA AUTOMATICA - "+cRotina+" - "+aRet[2],@aLog,nAtu)
					nQtNOk++
				EndIF

			Else

				nQtOk++
				AtuLog("OK MOT:REGISTRO INCLUIDO",@aLog,nAtu)

			EndIf
		EndIf

		FT_FSKIP()
	End

	FT_FUSE()

	AAdd(aLog, "Import = Total de Registros = "+ Alltrim(Str(nQtReg)))
	AAdd(aLog, "Import = Registros Nao importados = "+ Alltrim(Str(nQtNOk)))
	AAdd(aLog, "Import = Registros importados = "+ Alltrim(Str(nQtOk)))
	AAdd(aLog, "Import = FIM Data "+DtoC(dDataBase)+ " as "+Time() )

	// ######################################################
	//		Finaliza arquivo de Log
	// ######################################################

	nHdl  := 	fCreate(cArq)

	If nHdl == -1
		MsgAlert("O arquivo  "+cArq+" nao pode ser criado!","Atencao!")
		fClose(nHdl)
		fErase(cArq)
		RestArea(aArea)
	 	Return()
	EndIf

	For nCont:=1 to Len(aLog)

		cLin += aLog[nCont] + CHR(13)+CHR(10)

		If fWrite(nHdl,cLin,Len(cLin)) != Len(cLin)
			fClose(nHdl)
		    fErase(cArq)
		    cLin:=""
			RestArea(aArea)
		    Return()
		EndIf

		cLin:=""

	Next

	fClose(nHdl)

	ApMsgInfo("Verifique arquivo de log "+cArq)

	RestArea(aArea)

Return


// #########################################################################################
// Programa  : AtuLog
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor             | Descricao
// ---------+-------------------+-----------------------------------------------------------
// 28/06/13 | Karlos Morais     |
// ---------+-------------------+-----------------------------------------------------------
// #########################################################################################

Static Function AtuLog(cMsg,aLog,nAtu)

	AAdd(aLog, " Import = Linha " + StrZero(nAtu,12) + " = " + " LOG = " + cMsg)

Return


// #########################################################################################
// Programa  : LeLinha
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor             | Descricao
// ---------+-------------------+-----------------------------------------------------------
// 28/06/13 | Karlos Morais     |
// ---------+-------------------+-----------------------------------------------------------
// #########################################################################################

Static Function LeLinha()

	Local cLinhaTmp		:= ""
	Local cLinhaM100	:= ""

	cLinhaTmp := FT_FReadLN()

	If !Empty(cLinhaTmp)

		cIdent:= Substr(cLinhaTmp,1,1)

		If Len(cLinhaTmp) < 1023
			cLinhaM100 := cLinhaTmp
		Else

			cLinAnt := cLinhaTmp
			cLinhaM100 += cLinAnt

			Ft_FSkip()

			cLinProx:= Ft_FReadLN()

			If Len(cLinProx) >= 1023 .and. Substr(cLinProx,1,1) <> cIdent

				While Len(cLinProx) >= 1023 .and. Substr(cLinProx,1,1) <> cIdent .and. !Ft_fEof()

					cLinhaM100 += cLinProx

					Ft_FSkip()

					cLinProx := Ft_fReadLn()

					If Len(cLinProx) < 1023 .and. Substr(cLinProx,1,1) <> cIdent
						cLinhaM100 += cLinProx
					Endif

				Enddo

			Else
				cLinhaM100 += cLinProx
			Endif

		Endif

	Endif

Return(cLinhaM100)


// #########################################################################################
// Programa  : TrataCols
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor             | Descricao
// ---------+-------------------+-----------------------------------------------------------
// 28/06/13 | Karlos Morais     |
// ---------+-------------------+-----------------------------------------------------------
// #########################################################################################

Static Function TrataCols(cLinha,cSep)

	Local aRet		:= {}
	Local nPosSep	:= 0

	nPosSep	:= At(cSep,cLinha)

	While nPosSep <> 0

		AAdd(aRet, SubStr(cLinha,1,nPosSep-1)  )

		cLinha	:= SubStr(cLinha,nPosSep+1)
	 	nPosSep	:= At(cSep,cLinha)

	EndDo

	AAdd(aRet, cLinha )

Return aRet


// #########################################################################################
// Programa  : RetCol
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor             | Descricao
// ---------+-------------------+-----------------------------------------------------------
// 28/06/13 | Karlos Morais     |
// ---------+-------------------+-----------------------------------------------------------
// #########################################################################################

Static Function RetCol(cCpo,aCols,aHeader)

	Local cRet		:= ""
	Local nPos		:= 0
	Local aSX3Area	:= SX3->(GetArea())

	nPos := AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim(cCpo)) })

	If !Empty(nPos)

		If Upper(AllTrim(aCols[nPos])) <> "NULL"

			DbSelectArea("SX3")
			DbSetOrder(2)

			If MsSeek(cCpo)
				If SX3->X3_TIPO == "D"
					cRet := StoD(AllTrim(aCols[nPos]))
				ElseIf SX3->X3_TIPO == "N"
					cRet := Val(AllTrim(aCols[nPos]))
				Else
					cRet := PadR(Upper(AllTrim(aCols[nPos])),TamSX3(cCpo)[1])
				EndIf
			Else
				cRet := Upper(AllTrim(aCols[nPos]))
			EndIf

		EndIf

	EndIf

	SX3->(RestArea(aSX3Area))

Return cRet


// #########################################################################################
// Programa  : ImpVldCols
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor             | Descricao
// ---------+-------------------+-----------------------------------------------------------
// 28/06/13 | Karlos Morais     |
// ---------+-------------------+-----------------------------------------------------------
// #########################################################################################

Static Function ImpVldCols(cCdAlias,aHeader)

	Local cRet := ""

	Do Case

		Case cCdAlias == "SRJ"
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RJ_FUNCAO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RJ_FUNCAO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RJ_DESC")) })		== 0
				cRet += IIf(Empty(cRet),"","/")+"RJ_DESC"
			EndIf
			
		Case cCdAlias == "SRA"
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_FILIAL")) })		== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_FILIAL"
			EndIf		
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_MAT")) })		== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_MAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_NOME")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_NOME"
			EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_ENDEREC")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_ENDEREC"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_COMPLEM")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_COMPLEM"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_BAIRRO")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_BAIRRO"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_MUNICIP")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_MUNICIP"  
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_ESTADO")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_ESTADO"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_CEP")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_CEP"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_TELEFON")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_TELEFON"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_PAI")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_PAI"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_MAE")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_MAE"
			//EndIf			
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_NATURAL")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_NATURAL"
			EndIf 
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_NACIONA")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_NACIONA"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_ESTCIVI")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_ESTCIVI"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_SEXO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_SEXO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_NASC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_NASC"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_CC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_CC"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_ADMISSA")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_ADMISSA"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_OPCAO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_OPCAO"
			EndIf				
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_BCDPFGT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_BCDPFGT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_CTDPFGT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_CTDPFGT"
			EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_SITFOLH")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_SITFOLH"
			//EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_HRSMES")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_HRSMES"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_HRSEMAN")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_HRSEMAN"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_CODFUNC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_CODFUNC"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_CATFUNC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_CATFUNC"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_TIPOPGT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_TIPOPGT"
			EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_SALARIO")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_SALARIO"
			//EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_TIPOADM")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_TIPOADM"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_VIEMRAI")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_VIEMRAI"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_GRINRAI")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_GRINRAI"
			EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_CARGO")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_CARGO"
			//EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_HOPARC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_HOPARC"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_COMPSAB")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_COMPSAB"
			EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_CIC")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_CIC"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_PIS")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_PIS"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_RG")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_RG"
			//EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_NUMCP")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_NUMCP"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_SERCP")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_SERCP"
			EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_UFCP")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_UFCP"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_HABILIT")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_HABILIT"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_RESERVI")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_RESERVI"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_TITULOE")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_TITULOE"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_NOMECMP")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_NOMECMP"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_ZONASEC")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_ZONASEC"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_DEPIR")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_DEPIR"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_DEPSF")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_DEPSF"
			//EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_ADTPOSE")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_ADTPOSE"
			EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_CESTAB")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_CESTAB"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_CHAPA")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_CHAPA"
			//EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_TNOTRAB")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RA_TNOTRAB"
			EndIf				
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_CRACHA")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_CRACHA"
			//EndIf			
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_DEFIFIS")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_DEFIFIS"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_RACACOR")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_RACACOR"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_EMAIL")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_EMAIL"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_TPDEFFI")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_TPDEFFI"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_DTCPEXP")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_DTCPEXP"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_DTRGEXP")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_DTRGEXP"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_RGEXP")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_RGEXP"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_NUMINSC")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_NUMINSC"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_TIPOALT")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_TIPOALT"
			//EndIf
			//If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RA_DATAALT")) })	== 0
			//	cRet += IIf(Empty(cRet),"","/")+"RA_DATAALT"
			//EndIf
			
			
			Case cCdAlias == "SRQ"
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_FILIAL")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_FILIAL"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_MAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_MAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_ORDEM")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_ORDEM"  
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_SEQUENC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_SEQUENC"
			EndIf			
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_NOME")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_NOME"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_CIC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_CIC"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_PERCENT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_PERCENT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_NRSLMIN")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_NRSLMIN"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_VERBAS")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_VERBAS"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_VERBADT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_VERBADT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_VERBFOL")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_VERBFOL"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_VERBFER")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_VERBFER"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_VERB131")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_VERB131"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_VERB132")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_VERB132"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_VERBPLR")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_VERBPLR"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_IMPCTRE")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_IMPCTRE"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_VALFIXO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_VALFIXO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_CALSLIQ")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_CALSLIQ"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_VERBDFE")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_VERBDFE"
			EndIf			
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_BCDEPBE")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_BCDEPBE"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_CTDEPBE")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_CTDEPBE"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_DTINI")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_DTINI"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_DTFIM")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_DTFIM"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_PERFGTS")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_PERFGTS"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RQ_PERFGTS")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RQ_PERFGTS"
			EndIf
		Case cCdAlias == "SRF"
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_FILIAL")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_FILIAL"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_MAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_MAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DATABAS")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DATABAS"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DFERANT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DFERANT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DFERVAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DFERVAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_VPROVAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_VPROVAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_PD")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_PD"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_VIAPVAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_VIAPVAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_VFGTVAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_VFGTVAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DFERAAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DFERAAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_VPROAAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_VPROAAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_VIAPAAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_VIAPAAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_VFGTAAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_VFGTAAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_VPRDTAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_VPRDTAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_VINDTAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_VINDTAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_VFGDTAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_VFGDTAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_VADPVAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_VADPVAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_VADPAAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_VADPAAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_PAR13AT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_PAR13AT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_TADDTAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_TADDTAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_FERCOLE")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_FERCOLE"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_TEMABPE")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_TEMABPE"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DATAINI")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DATAINI"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DFEPRO1")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DFEPRO1"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DABPRO1")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DABPRO1"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DATINI2")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DATINI2"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DFEPRO2")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DFEPRO2"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DABPRO2")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DABPRO2"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DATINI3")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DATINI3"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DFEPRO3")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DFEPRO3"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DABPRO3")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DABPRO3"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DVENPEN")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DVENPEN"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_IVENPEN")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_IVENPEN"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_FVENPEN")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_FVENPEN"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DFALVAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DFALVAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_DFALAAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_DFALAAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RF_ABOPEC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RF_ABOPEC"
			EndIf	
			
			Case cCdAlias == "SRB"
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_FILIAL")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_FILIAL"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_MAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_MAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_COD")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_COD"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_NOME")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_NOME"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_DTNASC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_DTNASC"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_SEXO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_SEXO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_GRAUPAR")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_GRAUPAR"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_TIPIR")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_TIPIR"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_TIPSF")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_TIPSF"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_LOCNASC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_LOCNASC"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_CARTORI")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_CARTORI"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_NREGCAR")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_NREGCAR"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_NUMLIVR")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_NUMLIVR"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_NUMFOLH")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_NUMFOLH"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_DTENTRA")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_DTENTRA"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_DTBAIXA")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_DTBAIXA"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_CIC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_CIC"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_TPDEPAM")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_TPDEPAM"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_TIPAMED")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_TIPAMED"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_CODAMED")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_CODAMED"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_VBDESAM")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_VBDESAM"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_DTINIAM")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_DTINIAM"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_DTFIMAM")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_DTFIMAM"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_TPDPODO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_TPDPODO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_TPASODO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_TPASODO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_ASODONT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_ASODONT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_VBDESAO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_VBDESAO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_DTINIAO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_DTINIAO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_DTFIMAO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_DTFIMAO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_AUXCRE")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_AUXCRE"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_VLRCRE")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_VLRCRE"
			EndIf	
			
			Case cCdAlias == "SR8"
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R8_FILIAL")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R8_FILIAL"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R8_MAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R8_MAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R8_DATA")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R8_DATA"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R8_SEQ")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R8_SEQ"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R8_TIPO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R8_TIPO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R8_DATAINI")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R8_DATAINI"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_GRAUPAR")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_GRAUPAR"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_TIPIR")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_TIPIR"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_TIPSF")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_TIPSF"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_LOCNASC")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_LOCNASC"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RB_CARTORI")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RB_CARTORI"
			EndIf			
		
			Case cCdAlias == "SR3"
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R3_FILIAL")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R3_FILIAL"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R3_MAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R3_MAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R3_DATA")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R3_DATA"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R3_TIPO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R3_TIPO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R3_PD")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R3_PD"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R3_VALOR")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R3_VALOR"
			EndIf

			Case cCdAlias == "SR7"
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R7_FILIAL")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R7_FILIAL"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R7_MAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R7_MAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R7_DATA")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R7_DATA"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R7_TIPO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R7_TIPO"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("R7_FUNCAO")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"R7_FUNCAO"
			EndIf		
			
			Case cCdAlias == "SRD"
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RD_FILIAL")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RD_FILIAL"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RD_MAT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RD_MAT"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RD_PD")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RD_PD"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RD_TIPO1")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RD_TIPO1"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RD_HORAS")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RD_HORAS"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RD_VALOR")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RD_VALOR"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RD_DATAARQ")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RD_DATAARQ"
			EndIf
			If AScan(aHeader,{|x| Upper(AllTrim(x)) == Upper(Alltrim("RD_DATAPGT")) })	== 0
				cRet += IIf(Empty(cRet),"","/")+"RD_DATAPGT"
			EndIf		

	EndCase

Return cRet


// #########################################################################################
// Programa  : ImpObrigat
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor             | Descricao
// ---------+-------------------+-----------------------------------------------------------
// 28/06/13 | Karlos Morais     |
// ---------+-------------------+-----------------------------------------------------------
// #########################################################################################

Static Function ImpObrigat(cCdAlias,aCols,aHeader)

	Local cRet := ""

	Do Case

		Case cCdAlias == "SRJ"
			If Empty(RetCol("RJ_FUNCAO",aCols,aHeader))
				cRet += " / Coluna RJ_FUNCAO esta vazia! "
			EndIf
			If Empty(RetCol("RJ_DESC",aCols,aHeader))
				cRet += " / Coluna RJ_DESC esta vazia! "
			EndIf
			
		Case cCdAlias == "SRA"
			If Empty(RetCol("RA_MAT",aCols,aHeader))
				cRet += " / Coluna RA_MAT esta vazia! "
			EndIf
			If Empty(RetCol("RA_NOME",aCols,aHeader))
				cRet += " / Coluna RA_NOME esta vazia! "
			EndIf
			If Empty(RetCol("RA_NATURAL",aCols,aHeader))
				cRet += " / Coluna RA_NATURAL esta vazia! "
			EndIf	
			If Empty(RetCol("RA_NACIONA",aCols,aHeader))
				cRet += " / Coluna RA_NACIONA esta vazia! "
			EndIf
			If Empty(RetCol("RA_ESTCIVI",aCols,aHeader))
				cRet += " / Coluna RA_ESTCIVI esta vazia! "
			EndIf
			If Empty(RetCol("RA_SEXO",aCols,aHeader))
				cRet += " / Coluna RA_SEXO esta vazia! "
			EndIf
			If Empty(RetCol("RA_NASC",aCols,aHeader))
				cRet += " / Coluna RA_NASC esta vazia! "
			EndIf
			If Empty(RetCol("RA_CC",aCols,aHeader))
				cRet += " / Coluna RA_CC esta vazia! "
			EndIf
			If Empty(RetCol("RA_ADMISSA",aCols,aHeader))
				cRet += " / Coluna RA_ADMISSA esta vazia! "
			EndIf			
			If Empty(RetCol("RA_BCDPFGT",aCols,aHeader))
				cRet += " / Coluna RA_BCDPFGT esta vazia! "
			EndIf
			If Empty(RetCol("RA_CTDPFGT",aCols,aHeader))
				cRet += " / Coluna RA_CTDPFGT esta vazia! "
			EndIf
			If Empty(RetCol("RA_HRSMES",aCols,aHeader))
				cRet += " / Coluna RA_HRSMES esta vazia! "
			EndIf
			If Empty(RetCol("RA_HRSEMAN",aCols,aHeader))
				cRet += " / Coluna RA_HRSEMAN esta vazia! "
			EndIf
			If Empty(RetCol("RA_CODFUNC",aCols,aHeader))
				cRet += " / Coluna RA_CODFUNC esta vazia! "
			EndIf
			If Empty(RetCol("RA_CATFUNC",aCols,aHeader))
				cRet += " / Coluna RA_CATFUNC esta vazia! "
			EndIf
			If Empty(RetCol("RA_TIPOPGT",aCols,aHeader))
				cRet += " / Coluna RA_TIPOPGT esta vazia! "
			EndIf
			If Empty(RetCol("RA_TIPOADM",aCols,aHeader))
				cRet += " / Coluna RA_TIPOADM esta vazia! "
			EndIf
			If Empty(RetCol("RA_VIEMRAI",aCols,aHeader))
				cRet += " / Coluna RA_VIEMRAI esta vazia! "
			EndIf
			If Empty(RetCol("RA_GRINRAI",aCols,aHeader))
				cRet += " / Coluna RA_GRINRAI esta vazia! "
			EndIf
			If Empty(RetCol("RA_HOPARC",aCols,aHeader))
				cRet += " / Coluna RA_HOPARC esta vazia! "
			EndIf
			If Empty(RetCol("RA_COMPSAB",aCols,aHeader))
				cRet += " / Coluna RA_COMPSAB esta vazia! "
			EndIf
			If Empty(RetCol("RA_NUMCP",aCols,aHeader))
				cRet += " / Coluna RA_NUMCP esta vazia! "
			EndIf
			If Empty(RetCol("RA_SERCP",aCols,aHeader))
				cRet += " / Coluna RA_SERCP esta vazia! "
			EndIf
			If Empty(RetCol("RA_ADTPOSE",aCols,aHeader))
				cRet += " / Coluna RA_ADTPOSE esta vazia! "
			EndIf
			If Empty(RetCol("RA_TNOTRAB",aCols,aHeader))
				cRet += " / Coluna RA_TNOTRAB esta vazia! "
			EndIf
			
			Case cCdAlias == "SRQ"			
			If Empty(RetCol("RQ_MAT",aCols,aHeader))
				cRet += " / Coluna RQ_MAT esta vazia! "
			EndIf
			If Empty(RetCol("RQ_FILIAL",aCols,aHeader))
				cRet += " / Coluna RQ_FILIAL esta vazia! "
			EndIf
			If Empty(RetCol("RQ_ORDEM",aCols,aHeader))
				cRet += " / Coluna RQ_ORDEM esta vazia! "
			EndIf			
			If Empty(RetCol("RQ_NOME",aCols,aHeader))
				cRet += " / Coluna RQ_NOME esta vazia! "
			EndIf
			If Empty(RetCol("RQ_PERCENT",aCols,aHeader))
				cRet += " / Coluna RQ_PERCENTE esta vazia! "
			EndIf
			
			Case cCdAlias == "SRB"
			If Empty(RetCol("RB_FILIAL",aCols,aHeader))
				cRet += " / Coluna RB_FILIAL esta vazia! "
			EndIf
			If Empty(RetCol("RB_MAT",aCols,aHeader))
				cRet += " / Coluna RB_MAT esta vazia! "
			EndIf
			If Empty(RetCol("RB_COD",aCols,aHeader))
				cRet += " / Coluna RB_COD esta vazia! "
			EndIf			
			If Empty(RetCol("RB_NOME",aCols,aHeader))
				cRet += " / Coluna RB_NOME esta vazia! "
			EndIf
			If Empty(RetCol("RB_DTNASC",aCols,aHeader))
				cRet += " / Coluna RB_DTNASC esta vazia! "
			EndIf
			If Empty(RetCol("RB_SEXO",aCols,aHeader))
				cRet += " / Coluna RB_SEXO esta vazia! "
			EndIf
			If Empty(RetCol("RB_GRAUPAR",aCols,aHeader))
				cRet += " / Coluna RB_GRAUPAR esta vazia! "
			EndIf
			If Empty(RetCol("RB_DTNASC",aCols,aHeader))
				cRet += " / Coluna RB_DTNASC esta vazia! "
			EndIf
			If Empty(RetCol("RB_TIPIR",aCols,aHeader))
				cRet += " / Coluna RB_TIPIR esta vazia! "
			EndIf
			If Empty(RetCol("RB_TIPSF",aCols,aHeader))
				cRet += " / Coluna RB_TIPSF esta vazia! "
			EndIf
			If Empty(RetCol("RB_VBDESAM",aCols,aHeader))
				cRet += " / Coluna RB_VBDESAM esta vazia! "
			EndIf
			If Empty(RetCol("RB_VBDESAO",aCols,aHeader))
				cRet += " / Coluna RB_VBDESAO esta vazia! "
			EndIf	
			
			Case cCdAlias == "SRF"
			If Empty(RetCol("RF_FILIAL",aCols,aHeader))
				cRet += " / Coluna RB_FILIAL esta vazia! "
			EndIf
			If Empty(RetCol("RF_MAT",aCols,aHeader))
				cRet += " / Coluna RF_MAT esta vazia! "
			EndIf
			If Empty(RetCol("RF_DATABAS",aCols,aHeader))
				cRet += " / Coluna RF_DATABAS esta vazia! "
			EndIf
			
			Case cCdAlias == "SR8"
			If Empty(RetCol("R8_FILIAL",aCols,aHeader))
				cRet += " / Coluna R8_FILIALesta vazia! "
			EndIf
			If Empty(RetCol("R8_MAT",aCols,aHeader))
				cRet += " / Coluna R8_MAT esta vazia! "
			EndIf
			If Empty(RetCol("R8_DATA",aCols,aHeader))
				cRet += " / Coluna R8_DATA esta vazia! "
			EndIf	
			If Empty(RetCol("R8_SEQ",aCols,aHeader))
				cRet += " / Coluna R8_SEQ esta vazia! "
			EndIf	
			If Empty(RetCol("R8_TIPO",aCols,aHeader))
				cRet += " / Coluna R8_TIPO esta vazia! "
			EndIf
			If Empty(RetCol("R8_DATAINI",aCols,aHeader))
				cRet += " / Coluna R8_DATAINI esta vazia! "
			EndIf	
			
			Case cCdAlias == "SR3"
			If Empty(RetCol("R3_FILIAL",aCols,aHeader))
				cRet += " / Coluna R3_FILIAL esta vazia! "
			EndIf
			If Empty(RetCol("R3_MAT",aCols,aHeader))
				cRet += " / Coluna R3_MAT esta vazia! "
			EndIf
			If Empty(RetCol("R3_DATA",aCols,aHeader))
				cRet += " / Coluna R3_DATA esta vazia! "
			EndIf
			If Empty(RetCol("R3_TIPO",aCols,aHeader))
				cRet += " / Coluna R3_TIPO esta vazia! "
			EndIf
			If Empty(RetCol("R3_PD",aCols,aHeader))
				cRet += " / Coluna R3_PD esta vazia! "
			EndIf
			If Empty(RetCol("R3_VALOR",aCols,aHeader))
				cRet += " / Coluna R3_VALOR esta vazia! "
			EndIf	
			
			Case cCdAlias == "SR7"
			If Empty(RetCol("R7_FILIAL",aCols,aHeader))
				cRet += " / Coluna R7_FILIAL esta vazia! "
			EndIf  
			If Empty(RetCol("R7_MAT",aCols,aHeader))
				cRet += " / Coluna R7_MAT esta vazia! "
			EndIf  
			If Empty(RetCol("R7_DATA",aCols,aHeader))
				cRet += " / Coluna R7_DATA esta vazia! "
			EndIf  
			If Empty(RetCol("R7_TIPO",aCols,aHeader))
				cRet += " / Coluna R7_TIPO esta vazia! "
			EndIf  
			If Empty(RetCol("R7_FUNCAO",aCols,aHeader))
				cRet += " / Coluna R7_FUNCAO esta vazia! "
			EndIf  
			
			Case cCdAlias == "SRD"
			If Empty(RetCol("RD_FILIAL",aCols,aHeader))
				cRet += " / Coluna RD_FILIAL esta vazia! "
			EndIf
			If Empty(RetCol("RD_MAT",aCols,aHeader))
				cRet += " / Coluna RD_MAT esta vazia! "
			EndIf
			If Empty(RetCol("RD_PD",aCols,aHeader))
				cRet += " / Coluna RD_PD esta vazia! "
			EndIf
			If Empty(RetCol("RD_TIPO1",aCols,aHeader))
				cRet += " / Coluna RD_TIPO1 esta vazia! "
			EndIf
			If Empty(RetCol("RD_HORAS",aCols,aHeader))
				cRet += " / Coluna RD_HORAS esta vazia! "
			EndIf
			If Empty(RetCol("RD_VALOR",aCols,aHeader))
				cRet += " / Coluna RD_VALOR esta vazia! "
			EndIf
			If Empty(RetCol("RD_DATAARQ",aCols,aHeader))
				cRet += " / Coluna RD_DATAARQ esta vazia! "
			EndIf
			If Empty(RetCol("RD_DATAPGT",aCols,aHeader))
				cRet += " / Coluna RD_DATAPGT esta vazia! "
			EndIf	 			

	EndCase

Return cRet


// #########################################################################################
// Programa  : ImpGrava
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor             | Descricao
// ---------+-------------------+-----------------------------------------------------------
// 28/06/13 | Karlos Morais     |
// ---------+-------------------+-----------------------------------------------------------
// #########################################################################################

Static Function ImpGrava(cCdAlias,cRotina,aCols,aHeader)

	Local nX			:= 0
	Local cRotAuto		:= ""
	Local lOk			:= .F.
	Local cMsg			:= ""
	Local lGeraNumSeq	:= .T.
	Local cArqErro		:= "ERRO_AUTO.TXT"
	Local lTemFilial	:= .F.
	Local cCpoFilial
	Local cFilAlias		:= xFilial(cCdAlias)
	Local aItens		:= {}
	Private lMsHelpAuto	:= .T.
	Private lMsErroAuto	:= .F.
	Private aReg		:= {}
	

	// ######################################################
	//		Monta array com os campos do registro
	// ######################################################

	For nX:=1 to Len(aHeader)

		AAdd(aReg, {	Upper(Alltrim(aHeader[nX])),;
						RetCol(Alltrim(aHeader[nX]),aCols,aHeader),;
						Nil} )

		// ######################################################
		//	Verifica se informou filial no arquivo
		// ######################################################

		If Upper(Alltrim(aHeader[nX])) == cCpoFilial
			lTemFilial := .T.
	    EndIf

	Next

	IF cCdAlias$"SRA"
	
		/*cCpoFilial 	:= IIf( SubStr(cCdAlias,1,1) == "S", SubStr(cCdAlias,2,2), cCdAlias) + "_FILIAL"
	
		If !lTemFilial
			DbSelectArea(cCdAlias)
			AAdd(aReg, {	cCpoFilial,;
							cFilAlias,;
							Nil} )
		EndIf*/

		// ######################################################
		//		Chamada da rotina ExecAuto
		// ######################################################
	
		DbSelectArea(cCdAlias)
	
		cRotAuto := "MSExecAuto({|x,y,k,w|" +cRotina+"(x,y,k,w)},NIL,NIL,aReg,3)"
		&cRotAuto
	
		If lMsErroAuto
			MostraErro( GetSrvProfString("Startpath","") , cArqErro )
			cMsg := MemoRead(  GetSrvProfString("Startpath","") + '\' + cArqErro )
		Else
			RecLock("SRA",.F.)
	    	SRA->RA_FILIAL := aReg[1][2]
	      	Msunlock()
			 
			lOk := .T.
		EndIf
	
	/*ElseIf cCdAlias$"SR8"
	
		cCpoFilial 	:= IIf( SubStr(cCdAlias,1,1) == "S", SubStr(cCdAlias,2,2), cCdAlias) + "_FILIAL"
	
		If !lTemFilial
			DbSelectArea(cCdAlias)
			AAdd(aReg, {	cCpoFilial,;
							cFilAlias,;
							Nil} )
		EndIf

		// ######################################################
		//		Chamada da rotina ExecAuto
		// ######################################################
	
		DbSelectArea(cCdAlias)
	
		aAdd(aItens,aReg)
		
		cRotAuto := "MsExecAuto({|a,x,y,z| " + cRotina + "(a,x,y,z)},NIL,aReg,aItens,3)" // 3 - Inclusao, 4 - ALTERAR
		&cRotAuto
	
		If lMsErroAuto
			MostraErro( GetSrvProfString("Startpath","") , cArqErro )
			cMsg := MemoRead(  GetSrvProfString("Startpath","") + '\' + cArqErro )
		Else
			lOk := .T.
		EndIf*/
	
	ElseIf cCdAlias$"SRJ,SRQ,SRF,SR7,SR3,SRD,SR8"
	
		// ######################################################
		//		Chamada da rotina RecLock
		// ######################################################
		RecLock(cCdAlias,.T.)
		For nCont:=1 to Len(aHeader)
			(cCdAlias)->(&(aHeader[nCont])) := aReg[nCont][2]
		Next
		MsUnLock()
		
		lOk := .T.
	
	EndIF

Return {lOk, cMsg }


// #########################################################################################
// Programa  : ImpChgRadio
// ---------+-------------------+-----------------------------------------------------------
// Data     | Autor             | Descricao
// ---------+-------------------+-----------------------------------------------------------
// 28/06/13 | Karlos Morais     |
// ---------+-------------------+-----------------------------------------------------------
// #########################################################################################

Static Function ImpChgRadio(nRadioArq,cNmAlias)

	Do Case
		Case nRadioArq == 1
			cNmAlias := "Funções (SRJ - GPEA030)"
		Case nRadioArq == 2
			cNmAlias := "Funcionario (SRA - GPEA010)"
		Case nRadioArq == 3
			cNmAlias := "Dependentes (SRB - GPEA020)"
		Case nRadioArq == 4
			cNmAlias := "Beneficiarios (SRQ - GPEA280)"
		Case nRadioArq == 5
			cNmAlias := "Programação de Ferias (SRF - GPEA050)"
		Case nRadioArq == 6
			cNmAlias := "Afastamento (SR8 - GPEA240)"
		Case nRadioArq == 7
			cNmAlias := "Historico de Salario (SR7 - GPEA250)"
		Case nRadioArq == 8
			cNmAlias := "Acumulados (SRD - GPEA120)"
		Case nRadioArq == 9
			cNmAlias := "Histórico Valores Salariais (SR3)"
		OtherWise
			cNmAlias := "Processamento nao implementado"
	EndCase

Return