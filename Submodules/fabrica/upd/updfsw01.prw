#INCLUDE "Protheus.ch"
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o    ³ UPDFSW01 ³Autor  ³ FSW                   ³Data  ³ 20.Mar.11³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡„o ³ Atualizações referente ao processo                         ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Projeto   ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³                                                            ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function UPDFSW01()
Local aRet      := {{},{},{},{},{},{},{},{}}

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ ESTRUTURA DO ARRAY aRET:                                             ³
//ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
//³ aRet[01] - Array com os dados SX2                                    ³
//³ aRet[02] - Array com os dados SIX                                    ³
//³ aRet[03] - Array com os dados SX3                                    ³
//³ aRet[04] - Array com os dados SX5                                    ³
//³ aRet[05] - Array com os dados SX7                                    ³
//³ aRet[06] - Array com os dados SXA                                    ³
//³ aRet[07] - Array com os dados SXB                                    ³
//³ aRet[08] - Array com os dados SX6                                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

aRet[1] := AtuSX2()
aRet[2] := AtuSIX()
aRet[3] := AtuSX3()
aRet[5] := AtuSX7()
aRet[7] := AtuSXB()
aRet[8] := AtuSX6()

Return(aRet)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o    ³   AtuSX2 ³ Autor ³ FSW                   ³ Data ³ 20.Mar.11³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Retorna os dados para atualizacao do SX2                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function AtuSX2()
Local aSX2      := {}
Local cPath     := Posicione('SX2',1,'SF2','X2_PATH')
Local cNome     := SubStr(Posicione('SX2',1,'SF2','X2_ARQUIVO'),4,5)
/*
AAdd(aSX2,{	"ZW1",;						//Chave
			cPath,;							//Path
			"ZW1"+cNome,;						//Nome do Arquivo
			"Log WebService" ,; 		//Nome Port
			"Log WebService",;			//Nome Esp
			"Log WebService",;			//Nome Ing
			0,;									//Delete
			"E",;								//Acesso Filial  - (C)Compartilhado ou (E)Exclusivo
			"E",;								//Acesso Unidade - (C)Compartilhado ou (E)Exclusivo
			"E",;								//Acesso Empresa - (C)Compartilhado ou (E)Exclusivo
			"",;								//Rotina
			"N",;								//Pyme
			"",;								//Indice Unico
			"";									//Indice Display
			})*/

Return(aSX2)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±	±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o    ³   AtuSIX ³ Autor ³ FSW                   ³ Data ³ 20.Mar.11³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Retorna os dados para atualizacao do SIX                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function AtuSIX()
Local aSIX := {}
/*
aadd(aSIX,{	"ZW1",; 						//Indice
			"1",;                 	  		//Ordem
			"ZW1_FILIAL+ZW1_SERVIC+DTOS(ZW1_DATA)+ZW1_HORA",;			//Chave
			"Servico+Data+Hora" ,;							//Descricao Port.
			"Servico+Data+Hora" ,;							//Descricao Spa.
			"Servico+Data+Hora",;							//Descricao Eng.
			"U",;								//Proprietario
			"",;								//F3
			"",; 								//NickName
			"S"})								//ShowPesq*/

// atualiza as ordens dos indices especificos
U_UPDIndex(aSIX)


Return(aSIX)


/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o    ³   AtuSX3 ³ Autor ³ Richard Anderson      ³ Data ³ 20.Mar.11³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Retorna os dados para atualizacao do SX3                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/
Static Function AtuSX3()

Local aSX3      	:= {}
Local aPropCpos 	:= {}
Local cOrdem    	:= "01"
Local aSx3Filial	:= aSX3Filial()
Local cObrig		:= Str2bin("x       ")//CHR(8364)
Local cNObrig		:= ""
Local cUsado		:= Str2Bin(FirstBitOn(Space(99)+"x  ")) //Ultima posicao : Usado por Todos os Modulos
Local cNUsado		:= Str2Bin(FirstBitOn(Space(102)))
Local cResvNobr	:= X3Reserv("xxxxxx x")
Local aValSx3		:= {;
						POSICIONE("SX3",2,"C7_TOTAL","X3_TAMANHO");
						,POSICIONE("SX3",2,"C7_TOTAL","X3_DECIMAL");
						,POSICIONE("SX3",2,"C7_TOTAL","X3_PICTURE");
						}

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³VERIFICA AS PROPRIEDADES DOS CAMPOS³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
dbSelectArea("SX3")
SX3->(DbSetOrder(2))

AAdd( aPropCpos, {'FILIAL'} )
AAdd( aPropCpos, {'OBRIGATORIO-NAO ALTERAVEL'} )
AAdd( aPropCpos, {'VIRTUAL'} )
AAdd( aPropCpos, {'NORMAL'} )
AAdd( aPropCpos, {'OBRIGATORIO-ALTERAVEL'})
AAdd( aPropCpos, {'NAO USADO-NAO ALTERAVEL'})

//--Pesquisa um campo existente para gravar o Reserv e o Usado (Campo Filial)
If SX3->( MsSeek( "SF2_FILIAL" ) )
	AAdd( aPropCpos[1], {SX3->X3_USADO, SX3->X3_RESERV} )
EndIf
//--Pesquisa um campo existente para gravar o Reserv e o Usado (Campo Obrigatorio - Nao Alteravel)
//If SX3->( MsSeek( "DTC_LOTNFC" ) )
If SX3->( MsSeek( "A1_COD" ) )
	AAdd( aPropCpos[2], {SX3->X3_USADO, SX3->X3_RESERV} )
EndIf
//--Pesquisa um campo existente para gravar o Reserv e o Usado (Campo Virtual)
If SX3->( MsSeek( "DTY_NOMFOR" ) )
	AAdd( aPropCpos[3], {SX3->X3_USADO, SX3->X3_RESERV} )
EndIf
//--Pesquisa um campo existente para gravar o Reserv e o Usado (Campo Normal, sem obrigatoriedade)
//If SX3->( MsSeek( "DT3_ATALHO" ) )
If SX3->( MsSeek( "A1_BAIRRO" ) )
	AAdd( aPropCpos[4], {SX3->X3_USADO, SX3->X3_RESERV} )
EndIf
//--Pesquisa um campo OBRIGATORIO existente para gravar o Reserv e o Usado (Campo Obrigatorio - Alteravel)
If SX3->( MsSeek( "F2_CLIENTE" ) )
	AAdd( aPropCpos[5], {SX3->X3_USADO, SX3->X3_RESERV} )
EndIf
//--Pesquisa um campo Normal - todos os modulos (Campo Normal - sem obrigatoriedade)
If SX3->( MsSeek( "E2_OK" ) )
	AAdd( aPropCpos[6], {SX3->X3_USADO, SX3->X3_RESERV} )
EndIf

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ CAMPOS: TABELA                                    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

Aadd(aSX3,{	"SB1",;			//Arquivo
			"",;					//Ordem
			"B1_YCODINT",;		//Campo
			"C",;					//Tipo
			15,;           			//Tamanho
			0,;						//Decimal
			"Campo De/Para" ,;			//Titulo
			"Campo De/Para",;			//Titulo SPA
			"Campo De/Para",;			//Titulo ENG
			"Campo De/Para",;			//Descricao
			"Campo De/Para",;			//Descricao SPA
			"Campo De/Para",;			//Descricao ENG
			"@!",;   				//Picture
			'',;					//VALID
			cUsado,;				//USADO
			''      ,;				//RELACAO
			"",;					//F3
			1,;						//NIVEL
			aPropCpos[4][2][2],;	//RESERV
			"",;					//CHECK
			"",;					//TRIGGER	N=Nao habilita gatilho;S=Habilita Gatilho
			"U",;					//PROPRI	U=Usuario
			"N",;					//BROWSE	S=Visivel;N=Nao Visivel
			"A",;					//VISUAL	A=ALTERAR;V=VISUALIZA
			"R",;					//CONTEXT	R=REAL;V=VIRTUAL
			cNObrig,;				//OBRIGAT	cObrig=Obrigatorio;cNObrig=Nao obrigatorio
			"",;  					//VLDUSER
			"",;					//CBOX
			"",;					//CBOX SPA
			"",;					//CBOX ENG
			"",;					//PICTVAR
			"",;					//WHEN
			"",;					//INIBRW
			"",;					//SXG
			"",;					//FOLDER
			"N",;					//PYME
			"Campo De/Para com código utilizado nos outros sistemas"})					//Help


Aadd(aSX3,{	"SB1",;			//Arquivo
			"",;					//Ordem
			"B1_YTPCOD",;		//Campo
			"C",;					//Tipo
			1,;           			//Tamanho
			0,;						//Decimal
			"Tp Integracao" ,;			//Titulo
			"Tp Integracao",;			//Titulo SPA
			"Tp Integracao",;			//Titulo ENG
			"Tipo Integracao",;			//Descricao
			"Tipo Integracao",;			//Descricao SPA
			"Tipo Integracao",;			//Descricao ENG
			"@!",;   				//Picture
			'',;					//VALID
			cUsado,;				//USADO
			''      ,;				//RELACAO
			"",;					//F3
			1,;						//NIVEL
			aPropCpos[4][2][2],;	//RESERV
			"",;					//CHECK
			"",;					//TRIGGER	N=Nao habilita gatilho;S=Habilita Gatilho
			"U",;					//PROPRI	U=Usuario
			"N",;					//BROWSE	S=Visivel;N=Nao Visivel
			"A",;					//VISUAL	A=ALTERAR;V=VISUALIZA
			"R",;					//CONTEXT	R=REAL;V=VIRTUAL
			cNObrig,;				//OBRIGAT	cObrig=Obrigatorio;cNObrig=Nao obrigatorio
			"",;  					//VLDUSER
			"M=Modal;G=Guberman;C=Cargas",;					//CBOX
			"M=Modal;G=Guberman;C=Cargas",;					//CBOX SPA
			"M=Modal;G=Guberman;C=Cargas",;					//CBOX ENG
			"",;					//PICTVAR
			"",;					//WHEN
			"",;					//INIBRW
			"",;					//SXG
			"",;					//FOLDER
			"N",;					//PYME
			"Tipo de integração que utilizará o de/para"})					//Help

Aadd(aSX3,{	"SD3",;			//Arquivo
			"",;					//Ordem
			"D3_YOSGUB",;		//Campo
			"C",;					//Tipo
			10,;           			//Tamanho
			0,;						//Decimal
			"Num OS Guberman" ,;			//Titulo
			"Num OS Guberman",;			//Titulo SPA
			"Num OS Guberman",;			//Titulo ENG
			"Numero da OS Guberman",;			//Descricao
			"Numero da OS Guberman",;			//Descricao SPA
			"Numero da OS Guberman",;			//Descricao ENG
			"@!",;   				//Picture
			'',;					//VALID
			cUsado,;				//USADO
			''      ,;				//RELACAO
			"YGUBER",;					//F3
			1,;						//NIVEL
			aPropCpos[4][2][2],;	//RESERV
			"",;					//CHECK
			"",;					//TRIGGER	N=Nao habilita gatilho;S=Habilita Gatilho
			"U",;					//PROPRI	U=Usuario
			"N",;					//BROWSE	S=Visivel;N=Nao Visivel
			"A",;					//VISUAL	A=ALTERAR;V=VISUALIZA
			"R",;					//CONTEXT	R=REAL;V=VIRTUAL
			cNObrig,;				//OBRIGAT	cObrig=Obrigatorio;cNObrig=Nao obrigatorio
			"",;  					//VLDUSER
			"",;					//CBOX
			"",;					//CBOX SPA
			"",;					//CBOX ENG
			"",;					//PICTVAR
			"",;					//WHEN
			"",;					//INIBRW
			"",;					//SXG
			"",;					//FOLDER
			"N",;					//PYME
			"Numero da OS Guberman"})					//Help

Aadd(aSX3,{	"SD1",;			//Arquivo
			"",;					//Ordem
			"D1_YOSGUBS",;		//Campo
			"C",;					//Tipo
			10,;           			//Tamanho
			0,;						//Decimal
			"Num OS Guberman" ,;			//Titulo
			"Num OS Guberman",;			//Titulo SPA
			"Num OS Guberman",;			//Titulo ENG
			"Numero da OS Guberman",;			//Descricao
			"Numero da OS Guberman",;			//Descricao SPA
			"Numero da OS Guberman",;			//Descricao ENG
			"@!",;   				//Picture
			'',;					//VALID
			cUsado,;				//USADO
			''      ,;				//RELACAO
			"YGUBER",;					//F3
			1,;						//NIVEL
			aPropCpos[4][2][2],;	//RESERV
			"",;					//CHECK
			"",;					//TRIGGER	N=Nao habilita gatilho;S=Habilita Gatilho
			"U",;					//PROPRI	U=Usuario
			"N",;					//BROWSE	S=Visivel;N=Nao Visivel
			"A",;					//VISUAL	A=ALTERAR;V=VISUALIZA
			"R",;					//CONTEXT	R=REAL;V=VIRTUAL
			cNObrig,;				//OBRIGAT	cObrig=Obrigatorio;cNObrig=Nao obrigatorio
			"",;  					//VLDUSER
			"",;					//CBOX
			"",;					//CBOX SPA
			"",;					//CBOX ENG
			"",;					//PICTVAR
			"",;					//WHEN
			"",;					//INIBRW
			"",;					//SXG
			"",;					//FOLDER
			"N",;					//PYME
			"Numero da OS Guberman"})					//Help

Aadd(aSX3,{	"SC5",;			//Arquivo
			"",;					//Ordem
			"C5_YNUMOS",;		//Campo
			"C",;					//Tipo
			10,;           			//Tamanho
			0,;						//Decimal
			"Num OS" ,;			//Titulo
			"Num OS",;			//Titulo SPA
			"Num OS",;			//Titulo ENG
			"Numero da OS",;			//Descricao
			"Numero da OS",;			//Descricao SPA
			"Numero da OS",;			//Descricao ENG
			"@!",;   				//Picture
			'',;					//VALID
			cUsado,;				//USADO
			''      ,;				//RELACAO
			"",;					//F3
			1,;						//NIVEL
			aPropCpos[4][2][2],;	//RESERV
			"",;					//CHECK
			"",;					//TRIGGER	N=Nao habilita gatilho;S=Habilita Gatilho
			"U",;					//PROPRI	U=Usuario
			"N",;					//BROWSE	S=Visivel;N=Nao Visivel
			"A",;					//VISUAL	A=ALTERAR;V=VISUALIZA
			"R",;					//CONTEXT	R=REAL;V=VIRTUAL
			cNObrig,;				//OBRIGAT	cObrig=Obrigatorio;cNObrig=Nao obrigatorio
			"",;  					//VLDUSER
			"",;					//CBOX
			"",;					//CBOX SPA
			"",;					//CBOX ENG
			"",;					//PICTVAR
			"",;					//WHEN
			"",;					//INIBRW
			"",;					//SXG
			"",;					//FOLDER
			"N",;					//PYME
			"Numero da OS"})					//Help

Aadd(aSX3,{	"SC5",;			//Arquivo
			"",;					//Ordem
			"C5_YDTOS",;		//Campo
			"D",;					//Tipo
			8,;           			//Tamanho
			0,;						//Decimal
			"Data Fech OS" ,;			//Titulo
			"Data Fech OS",;			//Titulo SPA
			"Data Fech OS",;			//Titulo ENG
			"Data Fechamento da OS",;			//Descricao
			"Data Fechamento da OS",;			//Descricao SPA
			"Data Fechamento da OS",;			//Descricao ENG
			"@!",;   				//Picture
			'',;					//VALID
			cUsado,;				//USADO
			''      ,;				//RELACAO
			"",;					//F3
			1,;						//NIVEL
			aPropCpos[4][2][2],;	//RESERV
			"",;					//CHECK
			"",;					//TRIGGER	N=Nao habilita gatilho;S=Habilita Gatilho
			"U",;					//PROPRI	U=Usuario
			"N",;					//BROWSE	S=Visivel;N=Nao Visivel
			"V",;					//VISUAL	A=ALTERAR;V=VISUALIZA
			"R",;					//CONTEXT	R=REAL;V=VIRTUAL
			cNObrig,;				//OBRIGAT	cObrig=Obrigatorio;cNObrig=Nao obrigatorio
			"",;  					//VLDUSER
			"",;					//CBOX
			"",;					//CBOX SPA
			"",;					//CBOX ENG
			"",;					//PICTVAR
			"",;					//WHEN
			"",;					//INIBRW
			"",;					//SXG
			"",;					//FOLDER
			"N",;					//PYME
			"Data Fechamento da OS"})					//Help

Aadd(aSX3,{	"SC5",;			//Arquivo
			"",;					//Ordem
			"C5_YORIGEM",;		//Campo
			"C",;					//Tipo
			6,;           			//Tamanho
			0,;						//Decimal
			"Origem Pedido" ,;			//Titulo
			"Origem Pedido",;			//Titulo SPA
			"Origem Pedido",;			//Titulo ENG
			"Origem do Pedido",;			//Descricao
			"Origem do Pedido",;			//Descricao SPA
			"Origem do Pedido",;			//Descricao ENG
			"@!",;   				//Picture
			'',;					//VALID
			cUsado,;				//USADO
			''      ,;				//RELACAO
			"",;					//F3
			1,;						//NIVEL
			aPropCpos[4][2][2],;	//RESERV
			"",;					//CHECK
			"",;					//TRIGGER	N=Nao habilita gatilho;S=Habilita Gatilho
			"U",;					//PROPRI	U=Usuario
			"N",;					//BROWSE	S=Visivel;N=Nao Visivel
			"V",;					//VISUAL	A=ALTERAR;V=VISUALIZA
			"R",;					//CONTEXT	R=REAL;V=VIRTUAL
			cNObrig,;				//OBRIGAT	cObrig=Obrigatorio;cNObrig=Nao obrigatorio
			"",;  					//VLDUSER
			"M=Modal;C=Cargas",;					//CBOX
			"M=Modal;C=Cargas",;					//CBOX SPA
			"M=Modal;C=Cargas",;					//CBOX ENG
			"",;					//PICTVAR
			"",;					//WHEN
			"",;					//INIBRW
			"",;					//SXG
			"",;					//FOLDER
			"N",;					//PYME
			"Origem do Pedido"})					//Help

Aadd(aSX3,{	"SA1",;			//Arquivo
			"",;					//Ordem
			"A1_YBLOQ",;		//Campo
			"C",;					//Tipo
			1,;           			//Tamanho
			0,;						//Decimal
			"Bloqueio Financeiro" ,;			//Titulo
			"Bloqueio Financeiro",;			//Titulo SPA
			"Bloqueio Financeiro",;			//Titulo ENG
			"Bloqueio Financeiro",;			//Descricao
			"Bloqueio Financeiro",;			//Descricao SPA
			"Bloqueio Financeiro",;			//Descricao ENG
			"@!",;   				//Picture
			'',;					//VALID
			cUsado,;				//USADO
			'"L"'      ,;				//RELACAO
			"",;					//F3
			1,;						//NIVEL
			aPropCpos[4][2][2],;	//RESERV
			"",;					//CHECK
			"",;					//TRIGGER	N=Nao habilita gatilho;S=Habilita Gatilho
			"U",;					//PROPRI	U=Usuario
			"N",;					//BROWSE	S=Visivel;N=Nao Visivel
			"A",;					//VISUAL	A=ALTERAR;V=VISUALIZA
			"R",;					//CONTEXT	R=REAL;V=VIRTUAL
			cNObrig,;				//OBRIGAT	cObrig=Obrigatorio;cNObrig=Nao obrigatorio
			"",;  					//VLDUSER
			"B=Bloqueado;L=Liberado",;					//CBOX
			"B=Bloqueado;L=Liberado",;					//CBOX SPA
			"B=Bloqueado;L=Liberado",;					//CBOX ENG
			"",;					//PICTVAR
			"",;					//WHEN
			"",;					//INIBRW
			"",;					//SXG
			"",;					//FOLDER
			"N",;					//PYME
			"Bloqueio Financeiro"})					//Help

/*//ZW1
aSx3Filial[1]	:= "ZW1"
aSx3Filial[3]	:= "ZW1_FILIAL"
Aadd(aSX3, aClone(aSx3Filial) )	//Cria Campo Filial*/

Return(aSX3)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o    ³   AtuSXB ³ Autor ³ Richard Anderson      ³ Data ³ 07.Out.09³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Retorna os dados para atualizacao do SXB                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function AtuSXB()
//XB_ALIAS+XB_TIPO+XB_SEQ+XB_COLUNA
//DB-CONSULTA PADRÃO, POSICIONA DO INDEX DO ALIAS INDICADO NO REGISTRO TIPO 2
//RE-CONSULTA ESPERCIFICA, EXECUTA FUNÇÃO INDICADO NO REGISTRO TIPO 2 E XB_CONTEM
//US-USUARIO, USR
//GR-GRUPO
Local aSXB := {}
AADD(aSXB,{;				//PRINCIPAL
			"YGUBER";					//XB_ALIAS(6), ALIAS
			,"1";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"01";					//XB_SEQ(2), SEQUENCIAL
			,"RE";					//XB_COLUNA(2)
			,"OS do Guberman      ";	//XB_DESCRI(20)
			,"OS do Guberman      ";	//XB_DESCSPA(20)
			,"OS do Guberman      ";	//XB_DESCENG(20)
			,"";				//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})
AADD(aSXB,{;				//FUNÇÃO
			"YGUBER";					//XB_ALIAS(6), ALIAS
			,"2";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"01";					//XB_SEQ(2), SEQUENCIA DO INDEX
			,"01";					//XB_COLUNA(2)
			,"";			//XB_DESCRI(20)
			,"";			//XB_DESCSPA(20)
			,"";			//XB_DESCENG(20)
			,"u_yOsGurbem()";					//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})
AADD(aSXB,{;				//RETORNO
			"YGUBER";					//XB_ALIAS(6), ALIAS
			,"5";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"01";					//XB_SEQ(2), SEQUENCIA DO INDEX
			,"";					//XB_COLUNA(2)
			,"";			//XB_DESCRI(20)
			,"";			//XB_DESCSPA(20)
			,"";			//XB_DESCENG(20)
			,"u_RConEspX()";					//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})
/*
AADD(aSXB,{;				//PRINCIPAL
			"ZBADES";					//XB_ALIAS(6), ALIAS
			,"1";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"01";					//XB_SEQ(2), SEQUENCIAL
			,"DB";					//XB_COLUNA(2)
			,"Conta Consumo";	//XB_DESCRI(20)
			,"Conta Consumo";	//XB_DESCSPA(20)
			,"Conta Consumo";	//XB_DESCENG(20)
			,"ZBA";				//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})

AADD(aSXB,{;				//INDEX
			"ZBADES";					//XB_ALIAS(6), ALIAS
			,"2";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"01";					//XB_SEQ(2), SEQUENCIA DO INDEX
			,"03";					//XB_COLUNA(2)
			,"Nome+Dt Nasc";			//XB_DESCRI(20)
			,"Nome+Dt Nasc";			//XB_DESCSPA(20)
			,"Nome+Dt Nasc";			//XB_DESCENG(20)
			,"";					//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})

AADD(aSXB,{;				//INDEX
			"ZBADES";					//XB_ALIAS(6), ALIAS
			,"2";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"02";					//XB_SEQ(2), SEQUENCIA DO INDEX
			,"02";					//XB_COLUNA(2)
			,"Num Cartao";			//XB_DESCRI(20)
			,"Num Cartao";			//XB_DESCSPA(20)
			,"Num Cartao";			//XB_DESCENG(20)
			,"";					//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})

AADD(aSXB,{;				//COLUNAS POR INDEX
			"ZBADES";					//XB_ALIAS(6), ALIAS
			,"4";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"01";					//XB_SEQ(2), SEQUENCIA DO INDEX
			,"01";					//XB_COLUNA(2), COLUNA DO INDEX
			,"Cliente";				//XB_DESCRI(20)
			,"Cliente";				//XB_DESCSPA(20)
			,"Cliente";				//XB_DESCENG(20)
			,"ZBA_NOMCLI";			//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})

AADD(aSXB,{;				//COLUNAS POR INDEX
			"ZBADES";					//XB_ALIAS(6), ALIAS
			,"4";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"01";					//XB_SEQ(2), SEQUENCIA DO INDEX
			,"02";					//XB_COLUNA(2), COLUNA DO INDEX
			,"Dt Nasc";			//XB_DESCRI(20)
			,"Dt Nasc";			//XB_DESCSPA(20)
			,"Dt Nasc";			//XB_DESCENG(20)
			,"ZBA_DTNASC";			//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})

AADD(aSXB,{;				//COLUNAS POR INDEX
			"ZBADES";					//XB_ALIAS(6), ALIAS
			,"4";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"01";					//XB_SEQ(2), SEQUENCIA DO INDEX
			,"03";					//XB_COLUNA(2), COLUNA DO INDEX
			,"Num Cart";			//XB_DESCRI(20)
			,"Num Cart";			//XB_DESCSPA(20)
			,"Num Cart";			//XB_DESCENG(20)
			,"ZBA_NCARTA";		//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})

AADD(aSXB,{;				//COLUNAS POR INDEX
			"ZBADES";					//XB_ALIAS(6), ALIAS
			,"4";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"02";					//XB_SEQ(2), SEQUENCIA DO INDEX
			,"01";					//XB_COLUNA(2), COLUNA DO INDEX
			,"Num Cart";			//XB_DESCRI(20)
			,"Num Cart";			//XB_DESCSPA(20)
			,"Num Cart";			//XB_DESCENG(20)
			,"ZBA_NCARTA";		//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})

AADD(aSXB,{;				//COLUNAS POR INDEX
			"ZBADES";					//XB_ALIAS(6), ALIAS
			,"4";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"02";					//XB_SEQ(2), SEQUENCIA DO INDEX
			,"02";					//XB_COLUNA(2), COLUNA DO INDEX
			,"Cliente";				//XB_DESCRI(20)
			,"Cliente";				//XB_DESCSPA(20)
			,"Cliente";				//XB_DESCENG(20)
			,"ZBA_NOMCLI";			//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})

AADD(aSXB,{;				//COLUNAS POR INDEX
			"ZBADES";					//XB_ALIAS(6), ALIAS
			,"4";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"02";					//XB_SEQ(2), SEQUENCIA DO INDEX
			,"03";					//XB_COLUNA(2), COLUNA DO INDEX
			,"Dt Nasc";			//XB_DESCRI(20)
			,"Dt Nasc";			//XB_DESCSPA(20)
			,"Dt Nasc";			//XB_DESCENG(20)
			,"ZBA_DTNASC";			//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})

AADD(aSXB,{;				//RETORNO
			"ZBADES";					//XB_ALIAS(6), ALIAS
			,"5";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"01";					//XB_SEQ(2), SEQUENCIAL
			,"";					//XB_COLUNA(2)
			,"";					//XB_DESCRI(20)
			,"";					//XB_DESCSPA(20)
			,""	;					//XB_DESCENG(20)
			,"ZBA->ZBA_NCARTA";	//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})


/*
AADD(aSXB,{;				//FILTRO
			"ZBADES";					//XB_ALIAS(6), ALIAS
			,"6";					//XB_TIPO(1) 1-PRINCIPAL,2-INDEXS,3-CADASTRO NOVO(01),4-COLUNAS,5-RETORNO
			,"01";					//XB_SEQ(2), SEQUENCIAL
			,"";					//XB_COLUNA(2)
			,"";					//XB_DESCRI(20)
			,"";					//XB_DESCSPA(20)
			,""	;					//XB_DESCENG(20)
			,"ZE1->ZE1_STATUS=='2'.OR.EMPTY(ZE1->ZE1_STATUS)";		//XB_CONTEM(250)
			,"";					//XB_WCONTEM(250)
			})

*/

Return(aSXB)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o    ³   AtuSX6 ³ Autor ³ FSW                   ³ Data ³ 20.Jul.09³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Retorna os dados para atualizacao do SX6                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function AtuSX6()
Local aSX6 := {}
AADD(aSX6,{;
		.F.;			//Sobrepor se já existir
		,"";			//X6_FIL(2), FILIAL
		,"MV_YTESGUB";	//X6_VAR
		,"C";		//X6_TIPO
		,"TES de produtos a serem considerados"; //X6_DESCRIC
		,"TES de produtos a serem considerados como aplicação direta para o Guberman";//X6_DESCSPA
		,"TES de produtos a serem considerados como aplicação direta para o Guberman";	//X6_DESCENG
		,"como aplicação direta para o Guberman";	//X6_DESC1
		,"TES de produtos a serem considerados como aplicação direta para o Guberman";	//X6_DSCSPA1
		,"TES de produtos a serem considerados como aplicação direta para o Guberman";	//X6_DSCENG1
		,"";	//X6_DESC2
		,"";	//X6_DSCSPA2
		,"";	//X6_DSXENG2
		,"010;017";		//X6_CONTEUD
		,"";		//X6_CONTSPA
		,"";		//X6_CONTENG
		,"U";		//X6_PROPRI
		,"N";		//X6_PYME
		,"";		//X6_VALID
		,"";		//X6_INIT
		,"";		//X6_DEFPOR
		,"";		//X6_DEFSPA
		,"";		//X6_DEFENG
	})
AADD(aSX6,{;
		.F.;			//Sobrepor se já existir
		,"";			//X6_FIL(2), FILIAL
		,"MV_YSERGUB";	//X6_VAR
		,"C";		//X6_TIPO
		,"TES de Serviços a serem considerado "; //X6_DESCRIC
		,"TES de Serviços a serem considerado ";//X6_DESCSPA
		,"TES de Serviços a serem considerado ";	//X6_DESCENG
		,"como aplicação direta para Guberman";	//X6_DESC1
		,"como aplicação direta para Guberman";	//X6_DSCSPA1
		,"como aplicação direta para Guberman";	//X6_DSCENG1
		,"";	//X6_DESC2
		,"";	//X6_DSCSPA2
		,"";	//X6_DSXENG2
		,"018;019;020;021";		//X6_CONTEUD
		,"";		//X6_CONTSPA
		,"";		//X6_CONTENG
		,"U";		//X6_PROPRI
		,"N";		//X6_PYME
		,"";		//X6_VALID
		,"";		//X6_INIT
		,"";		//X6_DEFPOR
		,"";		//X6_DEFSPA
		,"";		//X6_DEFENG
	})
AADD(aSX6,{;
		.F.;			//Sobrepor se já existir
		,"";			//X6_FIL(2), FILIAL
		,"MV_YMAICARG";	//X6_VAR
		,"C";		//X6_TIPO
		,"Email com erro no webservice Carga"; //X6_DESCRIC
		,"Email com erro no webservice";//X6_DESCSPA
		,"Email com erro no webservice";	//X6_DESCENG
		,"";	//X6_DESC1
		,"";	//X6_DSCSPA1
		,"";	//X6_DSCENG1
		,"";	//X6_DESC2
		,"";	//X6_DSCSPA2
		,"";	//X6_DSXENG2
		,"cleyton@termaco.com.br";		//X6_CONTEUD
		,"";		//X6_CONTSPA
		,"";		//X6_CONTENG
		,"U";		//X6_PROPRI
		,"N";		//X6_PYME
		,"";		//X6_VALID
		,"";		//X6_INIT
		,"";		//X6_DEFPOR
		,"";		//X6_DEFSPA
		,"";		//X6_DEFENG
	})
AADD(aSX6,{;
		.F.;			//Sobrepor se já existir
		,"";			//X6_FIL(2), FILIAL
		,"MV_YMAIMOD";	//X6_VAR
		,"C";		//X6_TIPO
		,"Email com erro no webservice Modal"; //X6_DESCRIC
		,"Email com erro no webservice";//X6_DESCSPA
		,"Email com erro no webservice";	//X6_DESCENG
		,"";	//X6_DESC1
		,"";	//X6_DSCSPA1
		,"";	//X6_DSCENG1
		,"";	//X6_DESC2
		,"";	//X6_DSCSPA2
		,"";	//X6_DSXENG2
		,"cleyton@termaco.com.br";		//X6_CONTEUD
		,"";		//X6_CONTSPA
		,"";		//X6_CONTENG
		,"U";		//X6_PROPRI
		,"N";		//X6_PYME
		,"";		//X6_VALID
		,"";		//X6_INIT
		,"";		//X6_DEFPOR
		,"";		//X6_DEFSPA
		,"";		//X6_DEFENG
	})

Return(aSX6)

Static Function AtuSX7()
//"X7_CAMPO","X7_SEQUENC","X7_REGRA","X7_CDOMIN","X7_TIPO","X7_SEEK","X7_ALIAS","X7_ORDEM","X7_CHAVE","X7_PROPRI","X7_CONDIC"
//P-PRIMARIO
Local aSX7 := {}
/*AADD(aSX7,{;
			"ZB2_LOCAL";				//X7_CAMPO
			,"001";				//X7_SEQUENC
			,"M->ZB2_LOCAL";		//X7_REGRA
			,"ZB2_PDV";			//X7_CDOMIN
			,"P";					//X7_TIPO
			,"N";					//X7_SEEK
			,"";				//X7_ALIAS
			,0;						//X7_ORDEM
			,'';	//X7_CHAVE
			,"U";					//X7_PROPRI
			,"";					//X7_CONDIC
			})
*/

Return(aSX7)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o    ³ FSW01Des ³ Autor ³ FSW                   ³ Data ³ 20.Mar.11³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Retorna a Descricao do Update                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function FSW01Des()
Local aRet := {}

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ ESTRUTURA DO ARRAY aRET:                                             ³
//ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
//³ aRet[01] - (C) Nome da Function                                      ³
//³ aRet[02] - (C) Descritivo do Update                                  ³
//³ aRet[03] - (L) Situacao para determinar se o Update ja foi executado ³
//³ aRet[04] - (C) Projeto Lógico                                        ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
AAdd( aRet, 'UPDFSW01')
AAdd( aRet, 'Integracao Fabrica')
AAdd( aRet, VALTYPE(GETSX3CACHE("B1_YCODINT","X3_TAMANHO"))=="N" )
AAdd( aRet, 'Saulo Martins' )

Return( aRet )

Static Function aSX3Filial()
Local aSx3Filial	:= {}
Local nCont		:= 1
Local aEstrutSX3	:= {"X3_ARQUIVO","X3_ORDEM"		,"X3_CAMPO"		,"X3_TIPO"		,"X3_TAMANHO"	,"X3_DECIMAL"	,"X3_TITULO"	,"X3_TITSPA"	,;
		  		   "X3_TITENG" ,"X3_DESCRIC"	,"X3_DESCSPA"	,"X3_DESCENG"	,"X3_PICTURE"	,"X3_VALID"		,"X3_USADO"		,"X3_RELACAO"	,;
				   "X3_F3"		,"X3_NIVEL"		,"X3_RESERV"	,"X3_CHECK"		,"X3_TRIGGER"	,"X3_PROPRI"	,"X3_BROWSE"	,"X3_VISUAL"	,;
				   "X3_CONTEXT","X3_OBRIGAT"	,"X3_VLDUSER"	,"X3_CBOX"		,"X3_CBOXSPA"	,"X3_CBOXENG"	,"X3_PICTVAR"	,"X3_WHEN"		,;
				   "X3_INIBRW"	,"X3_GRPSXG"	,"X3_FOLDER"	,"X3_PYME"	}
SX3->(DbSetOrder(2))
If SX3->(DbSeek("F2_FILIAL"))
	For nCont:=1 to Len(aEstrutSX3)
		AADD(aSx3Filial,SX3->(&(aEstrutSX3[nCont])))
	Next
EndIf
aSx3Filial[2]	:= 1
AADD(aSX3Filial,OemToAnsi(GetHelp("F2_FILIAL")))
Return aSx3Filial

Static Function aSX3Campo(cCampo)
Local aSx3Campo	:= {}
Local nCont		:= 1
Local aEstrutSX3	:= {"X3_ARQUIVO","X3_ORDEM"		,"X3_CAMPO"		,"X3_TIPO"		,"X3_TAMANHO"	,"X3_DECIMAL"	,"X3_TITULO"	,"X3_TITSPA"	,;
		  		   "X3_TITENG" ,"X3_DESCRIC"	,"X3_DESCSPA"	,"X3_DESCENG"	,"X3_PICTURE"	,"X3_VALID"		,"X3_USADO"		,"X3_RELACAO"	,;
				   "X3_F3"		,"X3_NIVEL"		,"X3_RESERV"	,"X3_CHECK"		,"X3_TRIGGER"	,"X3_PROPRI"	,"X3_BROWSE"	,"X3_VISUAL"	,;
				   "X3_CONTEXT","X3_OBRIGAT"	,"X3_VLDUSER"	,"X3_CBOX"		,"X3_CBOXSPA"	,"X3_CBOXENG"	,"X3_PICTVAR"	,"X3_WHEN"		,;
				   "X3_INIBRW"	,"X3_GRPSXG"	,"X3_FOLDER"	,"X3_PYME"	}
SX3->(DbSetOrder(2))
If SX3->(DbSeek(cCampo))
	For nCont:=1 to Len(aEstrutSX3)
		AADD(aSx3Campo,SX3->(&(aEstrutSX3[nCont])))
	Next
EndIf
AADD(aSx3Campo,OemToAnsi(GetHelp(cCampo)))
Return aSx3Campo