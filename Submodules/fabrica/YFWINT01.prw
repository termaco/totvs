#include 'totvs.ch'
//Autor: Saulo Gomes Martins
//Data : 22/06/2013
//Descrição: Classe para integração com Guberman
CLASS YFWINT01
	DATA oWsdl
	DATA aOps
	DATA np_CodigoEmpresa
	DATA cWSErro
	DATA cName
	METHOD New() CONSTRUCTOR
	METHOD TrataPecaOS()
	METHOD TrataServicoOS()
ENDCLASS

//-----------------------------------------------------------------
METHOD New() CLASS YFWINT01
::oWsdl					:= WSWSGuberman():NEW()	//Inicializa o WebService
::cName					:= "YFWINT01"
::cWSErro					:= ""
::oWsdl:np_CodigoEmpresa	:= 1	//Fixo
::oWsdl:cp_Posicao		:= "U"	//Fixo
Return self

METHOD TrataPecaOS(p_Acao,np_NumeroOrdemServico,cp_CodigoPeca,np_QuantidadeRealizada,np_CustoUnitarioRealizado,np_CpfCnpjFornecedor,np_NumeroNF,cp_SerieNF,cp_DataEmissaoNF) CLASS YFWINT01
Local lRet
Local cData	:= DTOS(Date())	//AAAAMMDD
Default np_CpfCnpjFornecedor:= "0"
Default np_NumeroNF			:= "0"
Default cp_SerieNF			:= ""
Default cp_DataEmissaoNF		:= ""
::cWSErro						:= ""
WSDLDBGLEVEL(2)
If !Empty(cp_DataEmissaoNF)
	cp_DataEmissaoNF				:= SubStr(DTOS(cp_DataEmissaoNF),7,2)+"/"+SubStr(DTOS(cp_DataEmissaoNF),5,2)+"/"+SubStr(DTOS(cp_DataEmissaoNF),1,4)
EndIf
//::oWsdl:np_CodigoEmpresa
::oWsdl:np_NumeroOrdemServico		:= Val(np_NumeroOrdemServico)		//D3_YOSGUB
::oWsdl:cp_CodigoPeca				:= Alltrim(cp_CodigoPeca)				//B1_YCODINT,FILTRO B1_YTPCOD=G
::oWsdl:cp_CodigoPecaAlternativa	:= ""
::oWsdl:cp_Posicao					:= "U"
::oWsdl:np_NumeroRequisicao			:= ::oWsdl:np_NumeroOrdemServico
::oWsdl:cp_DataUtilizacao			:= SubStr(cData,7,2)+"/"+SubStr(cData,5,2)+"/"+SubStr(cData,1,4)
::oWsdl:np_QuantidadeRealizada		:= np_QuantidadeRealizada		//D3_QUANT
::oWsdl:np_CustoUnitarioRealizado	:= np_CustoUnitarioRealizado		//D3_CUSTO1
::oWsdl:np_CpfCnpjFornecedor		:= Val(np_CpfCnpjFornecedor)
::oWsdl:np_NumeroNF					:= Val(np_NumeroNF)
::oWsdl:cp_SerieNF					:= cp_SerieNF
::oWsdl:cp_DataEmissaoNF				:= cp_DataEmissaoNF
::oWsdl:np_Garantia					:= 0
::oWsdl:cp_Acao						:= p_Acao//"C"-Consultar,I-Inclusão,E-Exclusão
::oWsdl:np_TrataAcao					:= 0
If !::oWsdl:TrataPecaOS()
	::cWSErro	:= GETWSCERROR(3)
	varinfo( "",::cWSErro)
	Return .F.
ElseIf ::oWsdl:cTrataPecaOSResult<>""
	::cWSErro	:= ::oWsdl:cTrataPecaOSResult
	varinfo( "",::oWsdl:cTrataPecaOSResult)
	Return .F.
EndIf
Return .T.

METHOD TrataServicoOS(p_Acao,np_NumeroOrdemServico,np_CodigoServico,cp_DataRealizacao,np_CpfCnpjFornecedor,np_NumeroNF,cp_SerieNF,cp_DataEmissaoNF,np_ValorRealizado) CLASS YFWINT01
Local cData	:= DTOS(Date())	//AAAAMMDD
Default np_NumeroOrdemServico:= "0"
Default np_CodigoServico		:= "0"
Default np_CpfCnpjFornecedor:= "0"
Default np_NumeroNF			:= "0"
Default cp_SerieNF			:= ""
Default cp_DataEmissaoNF		:= ""
Default cp_DataRealizacao	:= ""
::cWSErro						:= ""
WSDLDBGLEVEL(2)
If !Empty(cp_DataRealizacao)
	cp_DataRealizacao				:= SubStr(DTOS(cp_DataRealizacao),7,2)+"/"+SubStr(DTOS(cp_DataRealizacao),5,2)+"/"+SubStr(DTOS(cp_DataRealizacao),1,4)
EndIf
If !Empty(cp_DataEmissaoNF)
	cp_DataEmissaoNF				:= SubStr(DTOS(cp_DataEmissaoNF),7,2)+"/"+SubStr(DTOS(cp_DataEmissaoNF),5,2)+"/"+SubStr(DTOS(cp_DataEmissaoNF),1,4)
EndIf
//::oWsdl:np_CodigoEmpresa
::oWsdl:np_NumeroOrdemServico		:= Val(np_NumeroOrdemServico)		//D3_YOSGUB
::oWsdl:np_CodigoServico				:= Val(np_CodigoServico)				//B1_YCODINT,FILTRO B1_YTPCOD=G
::oWsdl:cp_DataRealizacao			:= cp_DataRealizacao
::oWsdl:np_CpfCnpjRecurso			:= 0
::oWsdl:np_TempoGastoRealizacaoServico:= 0
::oWsdl:np_ValorHoraRecurso			:= 0
::oWsdl:np_CpfCnpjFornecedor		:= Val(np_CpfCnpjFornecedor)
::oWsdl:np_NumeroNF					:= Val(np_NumeroNF)
::oWsdl:cp_SerieNF					:= cp_SerieNF
::oWsdl:cp_DataEmissaoNF				:= cp_DataEmissaoNF
::oWsdl:np_ValorRealizado			:= np_ValorRealizado
::oWsdl:np_Garantia					:= 0
::oWsdl:cp_Acao						:= p_Acao//"C"-Consultar,I-Inclusão,E-Exclusão
::oWsdl:np_TrataAcao					:= 0
If !::oWsdl:TrataServicoOS()
	::cWSErro	:= GETWSCERROR(3)
	varinfo( "",::cWSErro)
	Return .F.
ElseIf ::oWsdl:cTrataServicoOSResult<>""
	::cWSErro	:= ::oWsdl:cTrataServicoOSResult
	varinfo( "",::oWsdl:cTrataServicoOSResult)
	Return .F.
EndIf
Return .T.

User Function YFWIN01B()
//WSDLDBGLEVEL(2)
oWS	:= YFWINT01():New()
oWS:TrataPecaOS(1,"aa",1,1)
Return