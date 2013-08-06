#INCLUDE "PROTHEUS.CH"
#INCLUDE "APWEBSRV.CH"
//METODO TrataRecursoHumano COMENDADO POIS TAMANHO DA LINHA MUITO GRANDE PARA COMPILAÇÃO
/* ===============================================================================
WSDL Location    http://192.168.15.25/WSGuberman.asmx?WSDL
Gerado em        07/22/13 11:28:08
Observações      Código-Fonte gerado por ADVPL WSDL Client 1.120703
                 Alterações neste arquivo podem causar funcionamento incorreto
                 e serão perdidas caso o código-fonte seja gerado novamente.
=============================================================================== */

User Function _QPYPESN ; Return  // "dummy" function - Internal Use 

/* -------------------------------------------------------------------------------
WSDL Service WSWSGuberman
------------------------------------------------------------------------------- */

WSCLIENT WSWSGuberman

	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD RESET
	WSMETHOD CLONE
	WSMETHOD TrataFuncao
	WSMETHOD TrataRecursoHumano
	WSMETHOD TrataFornecedor
	WSMETHOD TrataEntradaCombustivel
	WSMETHOD TrataGrupo
	WSMETHOD TrataSubgrupo
	WSMETHOD TrataPeca
	WSMETHOD TrataPecaOS
	WSMETHOD TrataServico
	WSMETHOD TrataServicoOS
	WSMETHOD DesativaPeca
	WSMETHOD DesativaServico

	WSDATA   _URL                      AS String
	WSDATA   _HEADOUT                  AS Array of String
	WSDATA   _COOKIES                  AS Array of String
	WSDATA   np_CodigoEmpresa          AS int
	WSDATA   np_CodigoFuncao           AS int
	WSDATA   cp_NomeFuncao             AS string
	WSDATA   np_MotoristaInstrutor     AS int
	WSDATA   cp_Acao                   AS string
	WSDATA   np_TrataAcao              AS int
	WSDATA   cTrataFuncaoResult        AS string
	WSDATA   cp_TipoPessoa             AS string
	WSDATA   np_CpfCnpj                AS long
	WSDATA   cp_NomeRecurso            AS string
	WSDATA   cp_DataNascimento         AS string
	WSDATA   cp_Apelido                AS string
	WSDATA   np_RecursoTerceirosNaoIdentificado AS int
	WSDATA   np_CodigoFilial           AS int
	WSDATA   np_CodigoDepartamento     AS int
	WSDATA   np_CpfCnpjInstrutor       AS long
	WSDATA   np_CpfCnpjAutonomo        AS long
	WSDATA   cp_NomeEmail              AS string
	WSDATA   cp_DataAdmissao           AS string
	WSDATA   cp_DataDesligamento       AS string
	WSDATA   cp_DataAfastamento        AS string
	WSDATA   cp_DataRetorno            AS string
	WSDATA   np_NumeroCarteiraProfissional AS int
	WSDATA   cp_SerieCarteiraProfissional AS string
	WSDATA   cp_UFCarteiraProfissional AS string
	WSDATA   cp_NumeroCarteiraIdentidade AS string
	WSDATA   cp_OrgaoExpediçãoCarteiraIdentidade AS string
	WSDATA   cp_DataEmissaoCarteiraIdentidade AS string
	WSDATA   np_ValorHora              AS decimal
	WSDATA   np_HorasTrabalhadasDia    AS decimal
	WSDATA   np_NumeroCNH              AS long
	WSDATA   cp_CategoriaCNH           AS string
	WSDATA   np_ProntuarioCNH          AS long
	WSDATA   cp_DataEmissaoCNH         AS string
	WSDATA   cp_DataValidadeCNH        AS string
	WSDATA   cp_OrgaoEmissorCNH        AS string
	WSDATA   cp_DataPrimeiraHabilitacao AS string
	WSDATA   cp_UFPrimeiraHabilitacao  AS string
	WSDATA   cp_DataReciclagem         AS string
	WSDATA   cp_DataVencimentoMOPP     AS string
	WSDATA   cp_DataRealizacaoDirecaoDefensiva AS string
	WSDATA   cp_DataValidadeDirecaoDefensiva AS string
	WSDATA   cp_DataRealizacaoExameMedico AS string
	WSDATA   cp_DataValidadeExameMedico AS string
	WSDATA   cp_DataRealizacaoPsicotecnico AS string
	WSDATA   cp_NumeroCrea             AS string
	WSDATA   cp_DataLimiteConducao     AS string
	WSDATA   cp_Endereco               AS string
	WSDATA   cp_Complemento            AS string
	WSDATA   cp_Bairro                 AS string
	WSDATA   cp_Cidade                 AS string
	WSDATA   cp_Uf                     AS string
	WSDATA   np_Cep                    AS int
	WSDATA   cp_DDDTelefone            AS string
	WSDATA   np_Telefone               AS int
	WSDATA   cp_DDDCelular             AS string
	WSDATA   np_Celular                AS int
	WSDATA   cp_DataInicioFerias       AS string
	WSDATA   cp_DataRetornoFerias      AS string
	WSDATA   np_EstadoCivil            AS int
	WSDATA   np_NumeroDependentes      AS int
	WSDATA   cp_NomeConjuge            AS string
	WSDATA   cp_NomePai                AS string
	WSDATA   cp_NomeMae                AS string
	WSDATA   cp_NomeParente            AS string
	WSDATA   cp_GrauParentesco         AS string
	WSDATA   cp_DDDParente             AS string
	WSDATA   np_TelefoneParente        AS int
	WSDATA   cp_Empresa1               AS string
	WSDATA   cp_DDD1                   AS string
	WSDATA   np_Telefone1              AS int
	WSDATA   cp_Endereco1              AS string
	WSDATA   cp_Municipio1             AS string
	WSDATA   cp_UF1                    AS string
	WSDATA   cp_DataAdmissao1          AS string
	WSDATA   cp_DataDesligamento1      AS string
	WSDATA   cp_MotivoDesligamento1    AS string
	WSDATA   cp_Empresa2               AS string
	WSDATA   cp_DDD2                   AS string
	WSDATA   np_Telefone2              AS int
	WSDATA   cp_Endereco2              AS string
	WSDATA   cp_Municipio2             AS string
	WSDATA   cp_UF2                    AS string
	WSDATA   cp_DataAdmissao2          AS string
	WSDATA   cp_DataDesligamento2      AS string
	WSDATA   cp_MotivoDesligamento2    AS string
	WSDATA   cp_Empresa3               AS string
	WSDATA   cp_DDD3                   AS string
	WSDATA   np_Telefone3              AS int
	WSDATA   cp_Endereco3              AS string
	WSDATA   cp_Municipio3             AS string
	WSDATA   cp_UF3                    AS string
	WSDATA   cp_DataAdmissao3          AS string
	WSDATA   cp_DataDesligamento3      AS string
	WSDATA   cp_MotivoDesligamento3    AS string
	WSDATA   cp_Empresa4               AS string
	WSDATA   cp_DDD4                   AS string
	WSDATA   np_Telefone4              AS int
	WSDATA   cp_Endereco4              AS string
	WSDATA   cp_Municipio4             AS string
	WSDATA   cp_UF4                    AS string
	WSDATA   cp_DataAdmissao4          AS string
	WSDATA   cp_DataDesligamento4      AS string
	WSDATA   cp_MotivoDesligamento4    AS string
	WSDATA   np_Autonomo               AS int
	WSDATA   np_PorcentagemTransferencia AS decimal
	WSDATA   np_PorcentagemEntrega     AS decimal
	WSDATA   np_PorcentagemComissao    AS decimal
	WSDATA   np_PorcentagemSeguro      AS decimal
	WSDATA   np_NumeroINSS             AS long
	WSDATA   np_NumeroAutorizacaoSeguradora AS long
	WSDATA   cp_DataValidadeAutorizacaoSeguradora AS string
	WSDATA   cp_CodigoCNAE             AS string
	WSDATA   cp_NomeBanco              AS string
	WSDATA   np_CodigoAgencia          AS long
	WSDATA   cp_NumeroConta            AS string
	WSDATA   cp_NomeSocio1             AS string
	WSDATA   cp_RGSocio1               AS string
	WSDATA   np_CpfCnpjSocio1          AS long
	WSDATA   cp_EnderecoSocio1         AS string
	WSDATA   cp_NomeSocio2             AS string
	WSDATA   cp_RGSocio2               AS string
	WSDATA   np_CpfCnpjSocio2          AS long
	WSDATA   cp_EnderecoSocio2         AS string
	WSDATA   cp_NomeSocio3             AS string
	WSDATA   cp_RGSocio3               AS string
	WSDATA   np_CpfCnpjSocio3          AS long
	WSDATA   cp_EnderecoSocio3         AS string
	WSDATA   cp_NomeProcurador         AS string
	WSDATA   cp_RGProcurador           AS string
	WSDATA   np_CpfCnpjProcurador      AS long
	WSDATA   cp_DDDProcurador          AS string
	WSDATA   np_TelefoneProcurador     AS int
	WSDATA   cp_EscritorioContador     AS string
	WSDATA   cp_NomeContador           AS string
	WSDATA   np_CRCContador            AS int
	WSDATA   cp_DDDContador            AS string
	WSDATA   np_TelefoneContador       AS int
	WSDATA   cp_LocalContrato          AS string
	WSDATA   cp_LocalContratoSocial    AS string
	WSDATA   cp_LocalCartaoCNPJ        AS string
	WSDATA   cp_LocalFichaCadastro     AS string
	WSDATA   np_NumeroCRV              AS long
	WSDATA   np_SituacaoCND            AS int
	WSDATA   cp_DataCRF                AS string
	WSDATA   cp_Serasa                 AS string
	WSDATA   cp_Observacao             AS string
	WSDATA   cTrataRecursoHumanoResult AS string
	WSDATA   cp_InscricaoEstadual      AS string
	WSDATA   cp_NomeFornecedor         AS string
	WSDATA   cp_NomeFantasia           AS string
	WSDATA   cp_DDDFax                 AS string
	WSDATA   np_Fax                    AS int
	WSDATA   cp_NomeContato1           AS string
	WSDATA   np_Ramal1                 AS int
	WSDATA   cp_NomeContato2           AS string
	WSDATA   np_Ramal2                 AS int
	WSDATA   cp_RegistroCrea           AS string
	WSDATA   np_PercentualISGQ         AS decimal
	WSDATA   cTrataFornecedorResult    AS string
	WSDATA   cp_CodigoTanque           AS string
	WSDATA   np_CpfCnpjFornecedor      AS long
	WSDATA   np_NumeroNF               AS long
	WSDATA   cp_SerieNF                AS string
	WSDATA   cp_DataEntrada            AS string
	WSDATA   np_Quantidade             AS decimal
	WSDATA   np_PrecoTotalItem         AS decimal
	WSDATA   cTrataEntradaCombustivelResult AS string
	WSDATA   np_CodigoGrupo            AS int
	WSDATA   cp_NomeGrupo              AS string
	WSDATA   cTrataGrupoResult         AS string
	WSDATA   np_CodigoSubgrupo         AS int
	WSDATA   cp_NomeSubgrupo           AS string
	WSDATA   cTrataSubgrupoResult      AS string
	WSDATA   cp_CodigoPeca             AS string
	WSDATA   cp_CodigoPecaAlternativa  AS string
	WSDATA   cp_NomePeca               AS string
	WSDATA   cp_Aplicacao              AS string
	WSDATA   np_QuantidadeHorasVidaUtil AS decimal
	WSDATA   np_QuantidadeKmsVidaUtil  AS int
	WSDATA   np_QuantidadeDiasVidaUtil AS int
	WSDATA   cp_UnidadeEstoque         AS string
	WSDATA   cp_CodigoFabrica          AS string
	WSDATA   cp_Marca01                AS string
	WSDATA   cp_Marca02                AS string
	WSDATA   cp_Marca03                AS string
	WSDATA   np_Original               AS int
	WSDATA   np_Desativa               AS int
	WSDATA   cTrataPecaResult          AS string
	WSDATA   np_NumeroOrdemServico     AS int
	WSDATA   cp_Posicao                AS string
	WSDATA   np_NumeroRequisicao       AS int
	WSDATA   cp_DataUtilizacao         AS string
	WSDATA   np_QuantidadeRealizada    AS decimal
	WSDATA   np_CustoUnitarioRealizado AS decimal
	WSDATA   cp_DataEmissaoNF          AS string
	WSDATA   np_Garantia               AS int
	WSDATA   cTrataPecaOSResult        AS string
	WSDATA   np_CodigoServico          AS int
	WSDATA   cp_NomeServico            AS string
	WSDATA   np_QuantidadeHorasPadrao  AS int
	WSDATA   np_ValorPadrao            AS decimal
	WSDATA   np_Inativo                AS int
	WSDATA   cTrataServicoResult       AS string
	WSDATA   cp_DataRealizacao         AS string
	WSDATA   np_CpfCnpjRecurso         AS long
	WSDATA   np_TempoGastoRealizacaoServico AS decimal
	WSDATA   np_ValorHoraRecurso       AS decimal
	WSDATA   np_ValorRealizado         AS decimal
	WSDATA   cTrataServicoOSResult     AS string
	WSDATA   cDesativaPecaResult       AS string
	WSDATA   cDesativaServicoResult    AS string

ENDWSCLIENT

WSMETHOD NEW WSCLIENT WSWSGuberman
::Init()
If !FindFunction("XMLCHILDEX")
	UserException("O Código-Fonte Client atual requer os executáveis do Protheus Build [7.00.121227P-20130625] ou superior. Atualize o Protheus ou gere o Código-Fonte novamente utilizando o Build atual.")
EndIf
Return Self

WSMETHOD INIT WSCLIENT WSWSGuberman
Return

WSMETHOD RESET WSCLIENT WSWSGuberman
	::np_CodigoEmpresa   := NIL 
	::np_CodigoFuncao    := NIL 
	::cp_NomeFuncao      := NIL 
	::np_MotoristaInstrutor := NIL 
	::cp_Acao            := NIL 
	::np_TrataAcao       := NIL 
	::cTrataFuncaoResult := NIL 
	::cp_TipoPessoa      := NIL 
	::np_CpfCnpj         := NIL 
	::cp_NomeRecurso     := NIL 
	::cp_DataNascimento  := NIL 
	::cp_Apelido         := NIL 
	::np_RecursoTerceirosNaoIdentificado := NIL 
	::np_CodigoFilial    := NIL 
	::np_CodigoDepartamento := NIL 
	::np_CpfCnpjInstrutor := NIL 
	::np_CpfCnpjAutonomo := NIL 
	::cp_NomeEmail       := NIL 
	::cp_DataAdmissao    := NIL 
	::cp_DataDesligamento := NIL 
	::cp_DataAfastamento := NIL 
	::cp_DataRetorno     := NIL 
	::np_NumeroCarteiraProfissional := NIL 
	::cp_SerieCarteiraProfissional := NIL 
	::cp_UFCarteiraProfissional := NIL 
	::cp_NumeroCarteiraIdentidade := NIL 
	::cp_OrgaoExpediçãoCarteiraIdentidade := NIL 
	::cp_DataEmissaoCarteiraIdentidade := NIL 
	::np_ValorHora       := NIL 
	::np_HorasTrabalhadasDia := NIL 
	::np_NumeroCNH       := NIL 
	::cp_CategoriaCNH    := NIL 
	::np_ProntuarioCNH   := NIL 
	::cp_DataEmissaoCNH  := NIL 
	::cp_DataValidadeCNH := NIL 
	::cp_OrgaoEmissorCNH := NIL 
	::cp_DataPrimeiraHabilitacao := NIL 
	::cp_UFPrimeiraHabilitacao := NIL 
	::cp_DataReciclagem  := NIL 
	::cp_DataVencimentoMOPP := NIL 
	::cp_DataRealizacaoDirecaoDefensiva := NIL 
	::cp_DataValidadeDirecaoDefensiva := NIL 
	::cp_DataRealizacaoExameMedico := NIL 
	::cp_DataValidadeExameMedico := NIL 
	::cp_DataRealizacaoPsicotecnico := NIL 
	::cp_NumeroCrea      := NIL 
	::cp_DataLimiteConducao := NIL 
	::cp_Endereco        := NIL 
	::cp_Complemento     := NIL 
	::cp_Bairro          := NIL 
	::cp_Cidade          := NIL 
	::cp_Uf              := NIL 
	::np_Cep             := NIL 
	::cp_DDDTelefone     := NIL 
	::np_Telefone        := NIL 
	::cp_DDDCelular      := NIL 
	::np_Celular         := NIL 
	::cp_DataInicioFerias := NIL 
	::cp_DataRetornoFerias := NIL 
	::np_EstadoCivil     := NIL 
	::np_NumeroDependentes := NIL 
	::cp_NomeConjuge     := NIL 
	::cp_NomePai         := NIL 
	::cp_NomeMae         := NIL 
	::cp_NomeParente     := NIL 
	::cp_GrauParentesco  := NIL 
	::cp_DDDParente      := NIL 
	::np_TelefoneParente := NIL 
	::cp_Empresa1        := NIL 
	::cp_DDD1            := NIL 
	::np_Telefone1       := NIL 
	::cp_Endereco1       := NIL 
	::cp_Municipio1      := NIL 
	::cp_UF1             := NIL 
	::cp_DataAdmissao1   := NIL 
	::cp_DataDesligamento1 := NIL 
	::cp_MotivoDesligamento1 := NIL 
	::cp_Empresa2        := NIL 
	::cp_DDD2            := NIL 
	::np_Telefone2       := NIL 
	::cp_Endereco2       := NIL 
	::cp_Municipio2      := NIL 
	::cp_UF2             := NIL 
	::cp_DataAdmissao2   := NIL 
	::cp_DataDesligamento2 := NIL 
	::cp_MotivoDesligamento2 := NIL 
	::cp_Empresa3        := NIL 
	::cp_DDD3            := NIL 
	::np_Telefone3       := NIL 
	::cp_Endereco3       := NIL 
	::cp_Municipio3      := NIL 
	::cp_UF3             := NIL 
	::cp_DataAdmissao3   := NIL 
	::cp_DataDesligamento3 := NIL 
	::cp_MotivoDesligamento3 := NIL 
	::cp_Empresa4        := NIL 
	::cp_DDD4            := NIL 
	::np_Telefone4       := NIL 
	::cp_Endereco4       := NIL 
	::cp_Municipio4      := NIL 
	::cp_UF4             := NIL 
	::cp_DataAdmissao4   := NIL 
	::cp_DataDesligamento4 := NIL 
	::cp_MotivoDesligamento4 := NIL 
	::np_Autonomo        := NIL 
	::np_PorcentagemTransferencia := NIL 
	::np_PorcentagemEntrega := NIL 
	::np_PorcentagemComissao := NIL 
	::np_PorcentagemSeguro := NIL 
	::np_NumeroINSS      := NIL 
	::np_NumeroAutorizacaoSeguradora := NIL 
	::cp_DataValidadeAutorizacaoSeguradora := NIL 
	::cp_CodigoCNAE      := NIL 
	::cp_NomeBanco       := NIL 
	::np_CodigoAgencia   := NIL 
	::cp_NumeroConta     := NIL 
	::cp_NomeSocio1      := NIL 
	::cp_RGSocio1        := NIL 
	::np_CpfCnpjSocio1   := NIL 
	::cp_EnderecoSocio1  := NIL 
	::cp_NomeSocio2      := NIL 
	::cp_RGSocio2        := NIL 
	::np_CpfCnpjSocio2   := NIL 
	::cp_EnderecoSocio2  := NIL 
	::cp_NomeSocio3      := NIL 
	::cp_RGSocio3        := NIL 
	::np_CpfCnpjSocio3   := NIL 
	::cp_EnderecoSocio3  := NIL 
	::cp_NomeProcurador  := NIL 
	::cp_RGProcurador    := NIL 
	::np_CpfCnpjProcurador := NIL 
	::cp_DDDProcurador   := NIL 
	::np_TelefoneProcurador := NIL 
	::cp_EscritorioContador := NIL 
	::cp_NomeContador    := NIL 
	::np_CRCContador     := NIL 
	::cp_DDDContador     := NIL 
	::np_TelefoneContador := NIL 
	::cp_LocalContrato   := NIL 
	::cp_LocalContratoSocial := NIL 
	::cp_LocalCartaoCNPJ := NIL 
	::cp_LocalFichaCadastro := NIL 
	::np_NumeroCRV       := NIL 
	::np_SituacaoCND     := NIL 
	::cp_DataCRF         := NIL 
	::cp_Serasa          := NIL 
	::cp_Observacao      := NIL 
	::cTrataRecursoHumanoResult := NIL 
	::cp_InscricaoEstadual := NIL 
	::cp_NomeFornecedor  := NIL 
	::cp_NomeFantasia    := NIL 
	::cp_DDDFax          := NIL 
	::np_Fax             := NIL 
	::cp_NomeContato1    := NIL 
	::np_Ramal1          := NIL 
	::cp_NomeContato2    := NIL 
	::np_Ramal2          := NIL 
	::cp_RegistroCrea    := NIL 
	::np_PercentualISGQ  := NIL 
	::cTrataFornecedorResult := NIL 
	::cp_CodigoTanque    := NIL 
	::np_CpfCnpjFornecedor := NIL 
	::np_NumeroNF        := NIL 
	::cp_SerieNF         := NIL 
	::cp_DataEntrada     := NIL 
	::np_Quantidade      := NIL 
	::np_PrecoTotalItem  := NIL 
	::cTrataEntradaCombustivelResult := NIL 
	::np_CodigoGrupo     := NIL 
	::cp_NomeGrupo       := NIL 
	::cTrataGrupoResult  := NIL 
	::np_CodigoSubgrupo  := NIL 
	::cp_NomeSubgrupo    := NIL 
	::cTrataSubgrupoResult := NIL 
	::cp_CodigoPeca      := NIL 
	::cp_CodigoPecaAlternativa := NIL 
	::cp_NomePeca        := NIL 
	::cp_Aplicacao       := NIL 
	::np_QuantidadeHorasVidaUtil := NIL 
	::np_QuantidadeKmsVidaUtil := NIL 
	::np_QuantidadeDiasVidaUtil := NIL 
	::cp_UnidadeEstoque  := NIL 
	::cp_CodigoFabrica   := NIL 
	::cp_Marca01         := NIL 
	::cp_Marca02         := NIL 
	::cp_Marca03         := NIL 
	::np_Original        := NIL 
	::np_Desativa        := NIL 
	::cTrataPecaResult   := NIL 
	::np_NumeroOrdemServico := NIL 
	::cp_Posicao         := NIL 
	::np_NumeroRequisicao := NIL 
	::cp_DataUtilizacao  := NIL 
	::np_QuantidadeRealizada := NIL 
	::np_CustoUnitarioRealizado := NIL 
	::cp_DataEmissaoNF   := NIL 
	::np_Garantia        := NIL 
	::cTrataPecaOSResult := NIL 
	::np_CodigoServico   := NIL 
	::cp_NomeServico     := NIL 
	::np_QuantidadeHorasPadrao := NIL 
	::np_ValorPadrao     := NIL 
	::np_Inativo         := NIL 
	::cTrataServicoResult := NIL 
	::cp_DataRealizacao  := NIL 
	::np_CpfCnpjRecurso  := NIL 
	::np_TempoGastoRealizacaoServico := NIL 
	::np_ValorHoraRecurso := NIL 
	::np_ValorRealizado  := NIL 
	::cTrataServicoOSResult := NIL 
	::cDesativaPecaResult := NIL 
	::cDesativaServicoResult := NIL 
	::Init()
Return

WSMETHOD CLONE WSCLIENT WSWSGuberman
Local oClone := WSWSGuberman():New()
	oClone:_URL          := ::_URL 
	oClone:np_CodigoEmpresa := ::np_CodigoEmpresa
	oClone:np_CodigoFuncao := ::np_CodigoFuncao
	oClone:cp_NomeFuncao := ::cp_NomeFuncao
	oClone:np_MotoristaInstrutor := ::np_MotoristaInstrutor
	oClone:cp_Acao       := ::cp_Acao
	oClone:np_TrataAcao  := ::np_TrataAcao
	oClone:cTrataFuncaoResult := ::cTrataFuncaoResult
	oClone:cp_TipoPessoa := ::cp_TipoPessoa
	oClone:np_CpfCnpj    := ::np_CpfCnpj
	oClone:cp_NomeRecurso := ::cp_NomeRecurso
	oClone:cp_DataNascimento := ::cp_DataNascimento
	oClone:cp_Apelido    := ::cp_Apelido
	oClone:np_RecursoTerceirosNaoIdentificado := ::np_RecursoTerceirosNaoIdentificado
	oClone:np_CodigoFilial := ::np_CodigoFilial
	oClone:np_CodigoDepartamento := ::np_CodigoDepartamento
	oClone:np_CpfCnpjInstrutor := ::np_CpfCnpjInstrutor
	oClone:np_CpfCnpjAutonomo := ::np_CpfCnpjAutonomo
	oClone:cp_NomeEmail  := ::cp_NomeEmail
	oClone:cp_DataAdmissao := ::cp_DataAdmissao
	oClone:cp_DataDesligamento := ::cp_DataDesligamento
	oClone:cp_DataAfastamento := ::cp_DataAfastamento
	oClone:cp_DataRetorno := ::cp_DataRetorno
	oClone:np_NumeroCarteiraProfissional := ::np_NumeroCarteiraProfissional
	oClone:cp_SerieCarteiraProfissional := ::cp_SerieCarteiraProfissional
	oClone:cp_UFCarteiraProfissional := ::cp_UFCarteiraProfissional
	oClone:cp_NumeroCarteiraIdentidade := ::cp_NumeroCarteiraIdentidade
	oClone:cp_OrgaoExpediçãoCarteiraIdentidade := ::cp_OrgaoExpediçãoCarteiraIdentidade
	oClone:cp_DataEmissaoCarteiraIdentidade := ::cp_DataEmissaoCarteiraIdentidade
	oClone:np_ValorHora  := ::np_ValorHora
	oClone:np_HorasTrabalhadasDia := ::np_HorasTrabalhadasDia
	oClone:np_NumeroCNH  := ::np_NumeroCNH
	oClone:cp_CategoriaCNH := ::cp_CategoriaCNH
	oClone:np_ProntuarioCNH := ::np_ProntuarioCNH
	oClone:cp_DataEmissaoCNH := ::cp_DataEmissaoCNH
	oClone:cp_DataValidadeCNH := ::cp_DataValidadeCNH
	oClone:cp_OrgaoEmissorCNH := ::cp_OrgaoEmissorCNH
	oClone:cp_DataPrimeiraHabilitacao := ::cp_DataPrimeiraHabilitacao
	oClone:cp_UFPrimeiraHabilitacao := ::cp_UFPrimeiraHabilitacao
	oClone:cp_DataReciclagem := ::cp_DataReciclagem
	oClone:cp_DataVencimentoMOPP := ::cp_DataVencimentoMOPP
	oClone:cp_DataRealizacaoDirecaoDefensiva := ::cp_DataRealizacaoDirecaoDefensiva
	oClone:cp_DataValidadeDirecaoDefensiva := ::cp_DataValidadeDirecaoDefensiva
	oClone:cp_DataRealizacaoExameMedico := ::cp_DataRealizacaoExameMedico
	oClone:cp_DataValidadeExameMedico := ::cp_DataValidadeExameMedico
	oClone:cp_DataRealizacaoPsicotecnico := ::cp_DataRealizacaoPsicotecnico
	oClone:cp_NumeroCrea := ::cp_NumeroCrea
	oClone:cp_DataLimiteConducao := ::cp_DataLimiteConducao
	oClone:cp_Endereco   := ::cp_Endereco
	oClone:cp_Complemento := ::cp_Complemento
	oClone:cp_Bairro     := ::cp_Bairro
	oClone:cp_Cidade     := ::cp_Cidade
	oClone:cp_Uf         := ::cp_Uf
	oClone:np_Cep        := ::np_Cep
	oClone:cp_DDDTelefone := ::cp_DDDTelefone
	oClone:np_Telefone   := ::np_Telefone
	oClone:cp_DDDCelular := ::cp_DDDCelular
	oClone:np_Celular    := ::np_Celular
	oClone:cp_DataInicioFerias := ::cp_DataInicioFerias
	oClone:cp_DataRetornoFerias := ::cp_DataRetornoFerias
	oClone:np_EstadoCivil := ::np_EstadoCivil
	oClone:np_NumeroDependentes := ::np_NumeroDependentes
	oClone:cp_NomeConjuge := ::cp_NomeConjuge
	oClone:cp_NomePai    := ::cp_NomePai
	oClone:cp_NomeMae    := ::cp_NomeMae
	oClone:cp_NomeParente := ::cp_NomeParente
	oClone:cp_GrauParentesco := ::cp_GrauParentesco
	oClone:cp_DDDParente := ::cp_DDDParente
	oClone:np_TelefoneParente := ::np_TelefoneParente
	oClone:cp_Empresa1   := ::cp_Empresa1
	oClone:cp_DDD1       := ::cp_DDD1
	oClone:np_Telefone1  := ::np_Telefone1
	oClone:cp_Endereco1  := ::cp_Endereco1
	oClone:cp_Municipio1 := ::cp_Municipio1
	oClone:cp_UF1        := ::cp_UF1
	oClone:cp_DataAdmissao1 := ::cp_DataAdmissao1
	oClone:cp_DataDesligamento1 := ::cp_DataDesligamento1
	oClone:cp_MotivoDesligamento1 := ::cp_MotivoDesligamento1
	oClone:cp_Empresa2   := ::cp_Empresa2
	oClone:cp_DDD2       := ::cp_DDD2
	oClone:np_Telefone2  := ::np_Telefone2
	oClone:cp_Endereco2  := ::cp_Endereco2
	oClone:cp_Municipio2 := ::cp_Municipio2
	oClone:cp_UF2        := ::cp_UF2
	oClone:cp_DataAdmissao2 := ::cp_DataAdmissao2
	oClone:cp_DataDesligamento2 := ::cp_DataDesligamento2
	oClone:cp_MotivoDesligamento2 := ::cp_MotivoDesligamento2
	oClone:cp_Empresa3   := ::cp_Empresa3
	oClone:cp_DDD3       := ::cp_DDD3
	oClone:np_Telefone3  := ::np_Telefone3
	oClone:cp_Endereco3  := ::cp_Endereco3
	oClone:cp_Municipio3 := ::cp_Municipio3
	oClone:cp_UF3        := ::cp_UF3
	oClone:cp_DataAdmissao3 := ::cp_DataAdmissao3
	oClone:cp_DataDesligamento3 := ::cp_DataDesligamento3
	oClone:cp_MotivoDesligamento3 := ::cp_MotivoDesligamento3
	oClone:cp_Empresa4   := ::cp_Empresa4
	oClone:cp_DDD4       := ::cp_DDD4
	oClone:np_Telefone4  := ::np_Telefone4
	oClone:cp_Endereco4  := ::cp_Endereco4
	oClone:cp_Municipio4 := ::cp_Municipio4
	oClone:cp_UF4        := ::cp_UF4
	oClone:cp_DataAdmissao4 := ::cp_DataAdmissao4
	oClone:cp_DataDesligamento4 := ::cp_DataDesligamento4
	oClone:cp_MotivoDesligamento4 := ::cp_MotivoDesligamento4
	oClone:np_Autonomo   := ::np_Autonomo
	oClone:np_PorcentagemTransferencia := ::np_PorcentagemTransferencia
	oClone:np_PorcentagemEntrega := ::np_PorcentagemEntrega
	oClone:np_PorcentagemComissao := ::np_PorcentagemComissao
	oClone:np_PorcentagemSeguro := ::np_PorcentagemSeguro
	oClone:np_NumeroINSS := ::np_NumeroINSS
	oClone:np_NumeroAutorizacaoSeguradora := ::np_NumeroAutorizacaoSeguradora
	oClone:cp_DataValidadeAutorizacaoSeguradora := ::cp_DataValidadeAutorizacaoSeguradora
	oClone:cp_CodigoCNAE := ::cp_CodigoCNAE
	oClone:cp_NomeBanco  := ::cp_NomeBanco
	oClone:np_CodigoAgencia := ::np_CodigoAgencia
	oClone:cp_NumeroConta := ::cp_NumeroConta
	oClone:cp_NomeSocio1 := ::cp_NomeSocio1
	oClone:cp_RGSocio1   := ::cp_RGSocio1
	oClone:np_CpfCnpjSocio1 := ::np_CpfCnpjSocio1
	oClone:cp_EnderecoSocio1 := ::cp_EnderecoSocio1
	oClone:cp_NomeSocio2 := ::cp_NomeSocio2
	oClone:cp_RGSocio2   := ::cp_RGSocio2
	oClone:np_CpfCnpjSocio2 := ::np_CpfCnpjSocio2
	oClone:cp_EnderecoSocio2 := ::cp_EnderecoSocio2
	oClone:cp_NomeSocio3 := ::cp_NomeSocio3
	oClone:cp_RGSocio3   := ::cp_RGSocio3
	oClone:np_CpfCnpjSocio3 := ::np_CpfCnpjSocio3
	oClone:cp_EnderecoSocio3 := ::cp_EnderecoSocio3
	oClone:cp_NomeProcurador := ::cp_NomeProcurador
	oClone:cp_RGProcurador := ::cp_RGProcurador
	oClone:np_CpfCnpjProcurador := ::np_CpfCnpjProcurador
	oClone:cp_DDDProcurador := ::cp_DDDProcurador
	oClone:np_TelefoneProcurador := ::np_TelefoneProcurador
	oClone:cp_EscritorioContador := ::cp_EscritorioContador
	oClone:cp_NomeContador := ::cp_NomeContador
	oClone:np_CRCContador := ::np_CRCContador
	oClone:cp_DDDContador := ::cp_DDDContador
	oClone:np_TelefoneContador := ::np_TelefoneContador
	oClone:cp_LocalContrato := ::cp_LocalContrato
	oClone:cp_LocalContratoSocial := ::cp_LocalContratoSocial
	oClone:cp_LocalCartaoCNPJ := ::cp_LocalCartaoCNPJ
	oClone:cp_LocalFichaCadastro := ::cp_LocalFichaCadastro
	oClone:np_NumeroCRV  := ::np_NumeroCRV
	oClone:np_SituacaoCND := ::np_SituacaoCND
	oClone:cp_DataCRF    := ::cp_DataCRF
	oClone:cp_Serasa     := ::cp_Serasa
	oClone:cp_Observacao := ::cp_Observacao
	oClone:cTrataRecursoHumanoResult := ::cTrataRecursoHumanoResult
	oClone:cp_InscricaoEstadual := ::cp_InscricaoEstadual
	oClone:cp_NomeFornecedor := ::cp_NomeFornecedor
	oClone:cp_NomeFantasia := ::cp_NomeFantasia
	oClone:cp_DDDFax     := ::cp_DDDFax
	oClone:np_Fax        := ::np_Fax
	oClone:cp_NomeContato1 := ::cp_NomeContato1
	oClone:np_Ramal1     := ::np_Ramal1
	oClone:cp_NomeContato2 := ::cp_NomeContato2
	oClone:np_Ramal2     := ::np_Ramal2
	oClone:cp_RegistroCrea := ::cp_RegistroCrea
	oClone:np_PercentualISGQ := ::np_PercentualISGQ
	oClone:cTrataFornecedorResult := ::cTrataFornecedorResult
	oClone:cp_CodigoTanque := ::cp_CodigoTanque
	oClone:np_CpfCnpjFornecedor := ::np_CpfCnpjFornecedor
	oClone:np_NumeroNF   := ::np_NumeroNF
	oClone:cp_SerieNF    := ::cp_SerieNF
	oClone:cp_DataEntrada := ::cp_DataEntrada
	oClone:np_Quantidade := ::np_Quantidade
	oClone:np_PrecoTotalItem := ::np_PrecoTotalItem
	oClone:cTrataEntradaCombustivelResult := ::cTrataEntradaCombustivelResult
	oClone:np_CodigoGrupo := ::np_CodigoGrupo
	oClone:cp_NomeGrupo  := ::cp_NomeGrupo
	oClone:cTrataGrupoResult := ::cTrataGrupoResult
	oClone:np_CodigoSubgrupo := ::np_CodigoSubgrupo
	oClone:cp_NomeSubgrupo := ::cp_NomeSubgrupo
	oClone:cTrataSubgrupoResult := ::cTrataSubgrupoResult
	oClone:cp_CodigoPeca := ::cp_CodigoPeca
	oClone:cp_CodigoPecaAlternativa := ::cp_CodigoPecaAlternativa
	oClone:cp_NomePeca   := ::cp_NomePeca
	oClone:cp_Aplicacao  := ::cp_Aplicacao
	oClone:np_QuantidadeHorasVidaUtil := ::np_QuantidadeHorasVidaUtil
	oClone:np_QuantidadeKmsVidaUtil := ::np_QuantidadeKmsVidaUtil
	oClone:np_QuantidadeDiasVidaUtil := ::np_QuantidadeDiasVidaUtil
	oClone:cp_UnidadeEstoque := ::cp_UnidadeEstoque
	oClone:cp_CodigoFabrica := ::cp_CodigoFabrica
	oClone:cp_Marca01    := ::cp_Marca01
	oClone:cp_Marca02    := ::cp_Marca02
	oClone:cp_Marca03    := ::cp_Marca03
	oClone:np_Original   := ::np_Original
	oClone:np_Desativa   := ::np_Desativa
	oClone:cTrataPecaResult := ::cTrataPecaResult
	oClone:np_NumeroOrdemServico := ::np_NumeroOrdemServico
	oClone:cp_Posicao    := ::cp_Posicao
	oClone:np_NumeroRequisicao := ::np_NumeroRequisicao
	oClone:cp_DataUtilizacao := ::cp_DataUtilizacao
	oClone:np_QuantidadeRealizada := ::np_QuantidadeRealizada
	oClone:np_CustoUnitarioRealizado := ::np_CustoUnitarioRealizado
	oClone:cp_DataEmissaoNF := ::cp_DataEmissaoNF
	oClone:np_Garantia   := ::np_Garantia
	oClone:cTrataPecaOSResult := ::cTrataPecaOSResult
	oClone:np_CodigoServico := ::np_CodigoServico
	oClone:cp_NomeServico := ::cp_NomeServico
	oClone:np_QuantidadeHorasPadrao := ::np_QuantidadeHorasPadrao
	oClone:np_ValorPadrao := ::np_ValorPadrao
	oClone:np_Inativo    := ::np_Inativo
	oClone:cTrataServicoResult := ::cTrataServicoResult
	oClone:cp_DataRealizacao := ::cp_DataRealizacao
	oClone:np_CpfCnpjRecurso := ::np_CpfCnpjRecurso
	oClone:np_TempoGastoRealizacaoServico := ::np_TempoGastoRealizacaoServico
	oClone:np_ValorHoraRecurso := ::np_ValorHoraRecurso
	oClone:np_ValorRealizado := ::np_ValorRealizado
	oClone:cTrataServicoOSResult := ::cTrataServicoOSResult
	oClone:cDesativaPecaResult := ::cDesativaPecaResult
	oClone:cDesativaServicoResult := ::cDesativaServicoResult
Return oClone

// WSDL Method TrataFuncao of Service WSWSGuberman

WSMETHOD TrataFuncao WSSEND np_CodigoEmpresa,np_CodigoFuncao,cp_NomeFuncao,np_MotoristaInstrutor,cp_Acao,np_TrataAcao WSRECEIVE cTrataFuncaoResult WSCLIENT WSWSGuberman
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<TrataFuncao xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoFuncao", ::np_CodigoFuncao, np_CodigoFuncao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeFuncao", ::cp_NomeFuncao, cp_NomeFuncao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_MotoristaInstrutor", ::np_MotoristaInstrutor, np_MotoristaInstrutor , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Acao", ::cp_Acao, cp_Acao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TrataAcao", ::np_TrataAcao, np_TrataAcao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</TrataFuncao>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/TrataFuncao",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cTrataFuncaoResult :=  WSAdvValue( oXmlRet,"_TRATAFUNCAORESPONSE:_TRATAFUNCAORESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method TrataRecursoHumano of Service WSWSGuberman

/*WSMETHOD TrataRecursoHumano 
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<TrataRecursoHumano xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TipoPessoa", ::cp_TipoPessoa, cp_TipoPessoa , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpj", ::np_CpfCnpj, np_CpfCnpj , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeRecurso", ::cp_NomeRecurso, cp_NomeRecurso , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataNascimento", ::cp_DataNascimento, cp_DataNascimento , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Apelido", ::cp_Apelido, cp_Apelido , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_RecursoTerceirosNaoIdentificado", ::np_RecursoTerceirosNaoIdentificado, np_RecursoTerceirosNaoIdentificado , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoFuncao", ::np_CodigoFuncao, np_CodigoFuncao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoFilial", ::np_CodigoFilial, np_CodigoFilial , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoDepartamento", ::np_CodigoDepartamento, np_CodigoDepartamento , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpjInstrutor", ::np_CpfCnpjInstrutor, np_CpfCnpjInstrutor , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpjAutonomo", ::np_CpfCnpjAutonomo, np_CpfCnpjAutonomo , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeEmail", ::cp_NomeEmail, cp_NomeEmail , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataAdmissao", ::cp_DataAdmissao, cp_DataAdmissao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataDesligamento", ::cp_DataDesligamento, cp_DataDesligamento , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataAfastamento", ::cp_DataAfastamento, cp_DataAfastamento , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataRetorno", ::cp_DataRetorno, cp_DataRetorno , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroCarteiraProfissional", ::np_NumeroCarteiraProfissional, np_NumeroCarteiraProfissional , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_SerieCarteiraProfissional", ::cp_SerieCarteiraProfissional, cp_SerieCarteiraProfissional , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_UFCarteiraProfissional", ::cp_UFCarteiraProfissional, cp_UFCarteiraProfissional , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroCarteiraIdentidade", ::cp_NumeroCarteiraIdentidade, cp_NumeroCarteiraIdentidade , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_OrgaoExpediçãoCarteiraIdentidade", ::cp_OrgaoExpediçãoCarteiraIdentidade, cp_OrgaoExpediçãoCarteiraIdentidade , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataEmissaoCarteiraIdentidade", ::cp_DataEmissaoCarteiraIdentidade, cp_DataEmissaoCarteiraIdentidade , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_ValorHora", ::np_ValorHora, np_ValorHora , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_HorasTrabalhadasDia", ::np_HorasTrabalhadasDia, np_HorasTrabalhadasDia , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroCNH", ::np_NumeroCNH, np_NumeroCNH , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CategoriaCNH", ::cp_CategoriaCNH, cp_CategoriaCNH , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_ProntuarioCNH", ::np_ProntuarioCNH, np_ProntuarioCNH , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataEmissaoCNH", ::cp_DataEmissaoCNH, cp_DataEmissaoCNH , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataValidadeCNH", ::cp_DataValidadeCNH, cp_DataValidadeCNH , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_OrgaoEmissorCNH", ::cp_OrgaoEmissorCNH, cp_OrgaoEmissorCNH , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataPrimeiraHabilitacao", ::cp_DataPrimeiraHabilitacao, cp_DataPrimeiraHabilitacao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_UFPrimeiraHabilitacao", ::cp_UFPrimeiraHabilitacao, cp_UFPrimeiraHabilitacao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataReciclagem", ::cp_DataReciclagem, cp_DataReciclagem , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataVencimentoMOPP", ::cp_DataVencimentoMOPP, cp_DataVencimentoMOPP , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataRealizacaoDirecaoDefensiva", ::cp_DataRealizacaoDirecaoDefensiva, cp_DataRealizacaoDirecaoDefensiva , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataValidadeDirecaoDefensiva", ::cp_DataValidadeDirecaoDefensiva, cp_DataValidadeDirecaoDefensiva , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataRealizacaoExameMedico", ::cp_DataRealizacaoExameMedico, cp_DataRealizacaoExameMedico , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataValidadeExameMedico", ::cp_DataValidadeExameMedico, cp_DataValidadeExameMedico , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataRealizacaoPsicotecnico", ::cp_DataRealizacaoPsicotecnico, cp_DataRealizacaoPsicotecnico , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroCrea", ::cp_NumeroCrea, cp_NumeroCrea , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataLimiteConducao", ::cp_DataLimiteConducao, cp_DataLimiteConducao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Endereco", ::cp_Endereco, cp_Endereco , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Complemento", ::cp_Complemento, cp_Complemento , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Bairro", ::cp_Bairro, cp_Bairro , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Cidade", ::cp_Cidade, cp_Cidade , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Uf", ::cp_Uf, cp_Uf , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Cep", ::np_Cep, np_Cep , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDDTelefone", ::cp_DDDTelefone, cp_DDDTelefone , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Telefone", ::np_Telefone, np_Telefone , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDDCelular", ::cp_DDDCelular, cp_DDDCelular , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Celular", ::np_Celular, np_Celular , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataInicioFerias", ::cp_DataInicioFerias, cp_DataInicioFerias , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataRetornoFerias", ::cp_DataRetornoFerias, cp_DataRetornoFerias , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_EstadoCivil", ::np_EstadoCivil, np_EstadoCivil , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroDependentes", ::np_NumeroDependentes, np_NumeroDependentes , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeConjuge", ::cp_NomeConjuge, cp_NomeConjuge , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomePai", ::cp_NomePai, cp_NomePai , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeMae", ::cp_NomeMae, cp_NomeMae , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeParente", ::cp_NomeParente, cp_NomeParente , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_GrauParentesco", ::cp_GrauParentesco, cp_GrauParentesco , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDDParente", ::cp_DDDParente, cp_DDDParente , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TelefoneParente", ::np_TelefoneParente, np_TelefoneParente , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Empresa1", ::cp_Empresa1, cp_Empresa1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDD1", ::cp_DDD1, cp_DDD1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Telefone1", ::np_Telefone1, np_Telefone1 , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Endereco1", ::cp_Endereco1, cp_Endereco1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Municipio1", ::cp_Municipio1, cp_Municipio1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_UF1", ::cp_UF1, cp_UF1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataAdmissao1", ::cp_DataAdmissao1, cp_DataAdmissao1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataDesligamento1", ::cp_DataDesligamento1, cp_DataDesligamento1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_MotivoDesligamento1", ::cp_MotivoDesligamento1, cp_MotivoDesligamento1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Empresa2", ::cp_Empresa2, cp_Empresa2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDD2", ::cp_DDD2, cp_DDD2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Telefone2", ::np_Telefone2, np_Telefone2 , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Endereco2", ::cp_Endereco2, cp_Endereco2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Municipio2", ::cp_Municipio2, cp_Municipio2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_UF2", ::cp_UF2, cp_UF2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataAdmissao2", ::cp_DataAdmissao2, cp_DataAdmissao2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataDesligamento2", ::cp_DataDesligamento2, cp_DataDesligamento2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_MotivoDesligamento2", ::cp_MotivoDesligamento2, cp_MotivoDesligamento2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Empresa3", ::cp_Empresa3, cp_Empresa3 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDD3", ::cp_DDD3, cp_DDD3 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Telefone3", ::np_Telefone3, np_Telefone3 , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Endereco3", ::cp_Endereco3, cp_Endereco3 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Municipio3", ::cp_Municipio3, cp_Municipio3 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_UF3", ::cp_UF3, cp_UF3 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataAdmissao3", ::cp_DataAdmissao3, cp_DataAdmissao3 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataDesligamento3", ::cp_DataDesligamento3, cp_DataDesligamento3 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_MotivoDesligamento3", ::cp_MotivoDesligamento3, cp_MotivoDesligamento3 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Empresa4", ::cp_Empresa4, cp_Empresa4 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDD4", ::cp_DDD4, cp_DDD4 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Telefone4", ::np_Telefone4, np_Telefone4 , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Endereco4", ::cp_Endereco4, cp_Endereco4 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Municipio4", ::cp_Municipio4, cp_Municipio4 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_UF4", ::cp_UF4, cp_UF4 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataAdmissao4", ::cp_DataAdmissao4, cp_DataAdmissao4 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataDesligamento4", ::cp_DataDesligamento4, cp_DataDesligamento4 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_MotivoDesligamento4", ::cp_MotivoDesligamento4, cp_MotivoDesligamento4 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Autonomo", ::np_Autonomo, np_Autonomo , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_PorcentagemTransferencia", ::np_PorcentagemTransferencia, np_PorcentagemTransferencia , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_PorcentagemEntrega", ::np_PorcentagemEntrega, np_PorcentagemEntrega , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_PorcentagemComissao", ::np_PorcentagemComissao, np_PorcentagemComissao , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_PorcentagemSeguro", ::np_PorcentagemSeguro, np_PorcentagemSeguro , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroINSS", ::np_NumeroINSS, np_NumeroINSS , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroAutorizacaoSeguradora", ::np_NumeroAutorizacaoSeguradora, np_NumeroAutorizacaoSeguradora , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataValidadeAutorizacaoSeguradora", ::cp_DataValidadeAutorizacaoSeguradora, cp_DataValidadeAutorizacaoSeguradora , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoCNAE", ::cp_CodigoCNAE, cp_CodigoCNAE , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeBanco", ::cp_NomeBanco, cp_NomeBanco , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoAgencia", ::np_CodigoAgencia, np_CodigoAgencia , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroConta", ::cp_NumeroConta, cp_NumeroConta , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeSocio1", ::cp_NomeSocio1, cp_NomeSocio1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_RGSocio1", ::cp_RGSocio1, cp_RGSocio1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpjSocio1", ::np_CpfCnpjSocio1, np_CpfCnpjSocio1 , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_EnderecoSocio1", ::cp_EnderecoSocio1, cp_EnderecoSocio1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeSocio2", ::cp_NomeSocio2, cp_NomeSocio2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_RGSocio2", ::cp_RGSocio2, cp_RGSocio2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpjSocio2", ::np_CpfCnpjSocio2, np_CpfCnpjSocio2 , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_EnderecoSocio2", ::cp_EnderecoSocio2, cp_EnderecoSocio2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeSocio3", ::cp_NomeSocio3, cp_NomeSocio3 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_RGSocio3", ::cp_RGSocio3, cp_RGSocio3 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpjSocio3", ::np_CpfCnpjSocio3, np_CpfCnpjSocio3 , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_EnderecoSocio3", ::cp_EnderecoSocio3, cp_EnderecoSocio3 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeProcurador", ::cp_NomeProcurador, cp_NomeProcurador , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_RGProcurador", ::cp_RGProcurador, cp_RGProcurador , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpjProcurador", ::np_CpfCnpjProcurador, np_CpfCnpjProcurador , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDDProcurador", ::cp_DDDProcurador, cp_DDDProcurador , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TelefoneProcurador", ::np_TelefoneProcurador, np_TelefoneProcurador , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_EscritorioContador", ::cp_EscritorioContador, cp_EscritorioContador , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeContador", ::cp_NomeContador, cp_NomeContador , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CRCContador", ::np_CRCContador, np_CRCContador , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDDContador", ::cp_DDDContador, cp_DDDContador , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TelefoneContador", ::np_TelefoneContador, np_TelefoneContador , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_LocalContrato", ::cp_LocalContrato, cp_LocalContrato , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_LocalContratoSocial", ::cp_LocalContratoSocial, cp_LocalContratoSocial , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_LocalCartaoCNPJ", ::cp_LocalCartaoCNPJ, cp_LocalCartaoCNPJ , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_LocalFichaCadastro", ::cp_LocalFichaCadastro, cp_LocalFichaCadastro , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroCRV", ::np_NumeroCRV, np_NumeroCRV , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_SituacaoCND", ::np_SituacaoCND, np_SituacaoCND , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataCRF", ::cp_DataCRF, cp_DataCRF , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Serasa", ::cp_Serasa, cp_Serasa , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Observacao", ::cp_Observacao, cp_Observacao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Acao", ::cp_Acao, cp_Acao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TrataAcao", ::np_TrataAcao, np_TrataAcao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</TrataRecursoHumano>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/TrataRecursoHumano",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cTrataRecursoHumanoResult :=  WSAdvValue( oXmlRet,"_TRATARECURSOHUMANORESPONSE:_TRATARECURSOHUMANORESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD
*/
oXmlRet := NIL
Return .T.

// WSDL Method TrataFornecedor of Service WSWSGuberman

WSMETHOD TrataFornecedor WSSEND np_CodigoEmpresa,cp_TipoPessoa,np_CpfCnpj,cp_InscricaoEstadual,cp_NomeFornecedor,cp_NomeFantasia,cp_Endereco,cp_Bairro,cp_Cidade,cp_Uf,np_Cep,cp_DDDFax,np_Fax,cp_NomeContato1,cp_DDD1,np_Telefone1,np_Ramal1,cp_NomeContato2,cp_DDD2,np_Telefone2,np_Ramal2,cp_RegistroCrea,np_PercentualISGQ,cp_NomeEmail,cp_Acao,np_TrataAcao WSRECEIVE cTrataFornecedorResult WSCLIENT WSWSGuberman
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<TrataFornecedor xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TipoPessoa", ::cp_TipoPessoa, cp_TipoPessoa , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpj", ::np_CpfCnpj, np_CpfCnpj , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_InscricaoEstadual", ::cp_InscricaoEstadual, cp_InscricaoEstadual , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeFornecedor", ::cp_NomeFornecedor, cp_NomeFornecedor , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeFantasia", ::cp_NomeFantasia, cp_NomeFantasia , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Endereco", ::cp_Endereco, cp_Endereco , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Bairro", ::cp_Bairro, cp_Bairro , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Cidade", ::cp_Cidade, cp_Cidade , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Uf", ::cp_Uf, cp_Uf , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Cep", ::np_Cep, np_Cep , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDDFax", ::cp_DDDFax, cp_DDDFax , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Fax", ::np_Fax, np_Fax , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeContato1", ::cp_NomeContato1, cp_NomeContato1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDD1", ::cp_DDD1, cp_DDD1 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Telefone1", ::np_Telefone1, np_Telefone1 , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Ramal1", ::np_Ramal1, np_Ramal1 , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeContato2", ::cp_NomeContato2, cp_NomeContato2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DDD2", ::cp_DDD2, cp_DDD2 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Telefone2", ::np_Telefone2, np_Telefone2 , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Ramal2", ::np_Ramal2, np_Ramal2 , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_RegistroCrea", ::cp_RegistroCrea, cp_RegistroCrea , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_PercentualISGQ", ::np_PercentualISGQ, np_PercentualISGQ , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeEmail", ::cp_NomeEmail, cp_NomeEmail , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Acao", ::cp_Acao, cp_Acao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TrataAcao", ::np_TrataAcao, np_TrataAcao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</TrataFornecedor>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/TrataFornecedor",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cTrataFornecedorResult :=  WSAdvValue( oXmlRet,"_TRATAFORNECEDORRESPONSE:_TRATAFORNECEDORRESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method TrataEntradaCombustivel of Service WSWSGuberman

WSMETHOD TrataEntradaCombustivel WSSEND np_CodigoEmpresa,cp_CodigoTanque,np_CpfCnpjFornecedor,np_NumeroNF,cp_SerieNF,cp_DataEntrada,np_Quantidade,np_PrecoTotalItem,cp_Acao,np_TrataAcao WSRECEIVE cTrataEntradaCombustivelResult WSCLIENT WSWSGuberman
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<TrataEntradaCombustivel xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoTanque", ::cp_CodigoTanque, cp_CodigoTanque , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpjFornecedor", ::np_CpfCnpjFornecedor, np_CpfCnpjFornecedor , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroNF", ::np_NumeroNF, np_NumeroNF , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_SerieNF", ::cp_SerieNF, cp_SerieNF , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataEntrada", ::cp_DataEntrada, cp_DataEntrada , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Quantidade", ::np_Quantidade, np_Quantidade , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_PrecoTotalItem", ::np_PrecoTotalItem, np_PrecoTotalItem , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Acao", ::cp_Acao, cp_Acao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TrataAcao", ::np_TrataAcao, np_TrataAcao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</TrataEntradaCombustivel>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/TrataEntradaCombustivel",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cTrataEntradaCombustivelResult :=  WSAdvValue( oXmlRet,"_TRATAENTRADACOMBUSTIVELRESPONSE:_TRATAENTRADACOMBUSTIVELRESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method TrataGrupo of Service WSWSGuberman

WSMETHOD TrataGrupo WSSEND np_CodigoEmpresa,np_CodigoGrupo,cp_NomeGrupo,cp_Acao,np_TrataAcao WSRECEIVE cTrataGrupoResult WSCLIENT WSWSGuberman
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<TrataGrupo xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoGrupo", ::np_CodigoGrupo, np_CodigoGrupo , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeGrupo", ::cp_NomeGrupo, cp_NomeGrupo , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Acao", ::cp_Acao, cp_Acao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TrataAcao", ::np_TrataAcao, np_TrataAcao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</TrataGrupo>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/TrataGrupo",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cTrataGrupoResult  :=  WSAdvValue( oXmlRet,"_TRATAGRUPORESPONSE:_TRATAGRUPORESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method TrataSubgrupo of Service WSWSGuberman

WSMETHOD TrataSubgrupo WSSEND np_CodigoEmpresa,np_CodigoSubgrupo,cp_NomeSubgrupo,cp_Acao,np_TrataAcao WSRECEIVE cTrataSubgrupoResult WSCLIENT WSWSGuberman
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<TrataSubgrupo xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoSubgrupo", ::np_CodigoSubgrupo, np_CodigoSubgrupo , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeSubgrupo", ::cp_NomeSubgrupo, cp_NomeSubgrupo , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Acao", ::cp_Acao, cp_Acao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TrataAcao", ::np_TrataAcao, np_TrataAcao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</TrataSubgrupo>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/TrataSubgrupo",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cTrataSubgrupoResult :=  WSAdvValue( oXmlRet,"_TRATASUBGRUPORESPONSE:_TRATASUBGRUPORESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method TrataPeca of Service WSWSGuberman

WSMETHOD TrataPeca WSSEND np_CodigoEmpresa,cp_CodigoPeca,cp_CodigoPecaAlternativa,cp_NomePeca,np_CodigoGrupo,np_CodigoSubgrupo,cp_Aplicacao,np_QuantidadeHorasVidaUtil,np_QuantidadeKmsVidaUtil,np_QuantidadeDiasVidaUtil,cp_UnidadeEstoque,cp_CodigoFabrica,cp_Marca01,cp_Marca02,cp_Marca03,np_Original,np_Desativa,cp_Acao,np_TrataAcao WSRECEIVE cTrataPecaResult WSCLIENT WSWSGuberman
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<TrataPeca xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoPeca", ::cp_CodigoPeca, cp_CodigoPeca , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoPecaAlternativa", ::cp_CodigoPecaAlternativa, cp_CodigoPecaAlternativa , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomePeca", ::cp_NomePeca, cp_NomePeca , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoGrupo", ::np_CodigoGrupo, np_CodigoGrupo , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoSubgrupo", ::np_CodigoSubgrupo, np_CodigoSubgrupo , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Aplicacao", ::cp_Aplicacao, cp_Aplicacao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_QuantidadeHorasVidaUtil", ::np_QuantidadeHorasVidaUtil, np_QuantidadeHorasVidaUtil , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_QuantidadeKmsVidaUtil", ::np_QuantidadeKmsVidaUtil, np_QuantidadeKmsVidaUtil , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_QuantidadeDiasVidaUtil", ::np_QuantidadeDiasVidaUtil, np_QuantidadeDiasVidaUtil , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_UnidadeEstoque", ::cp_UnidadeEstoque, cp_UnidadeEstoque , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoFabrica", ::cp_CodigoFabrica, cp_CodigoFabrica , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Marca01", ::cp_Marca01, cp_Marca01 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Marca02", ::cp_Marca02, cp_Marca02 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Marca03", ::cp_Marca03, cp_Marca03 , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Original", ::np_Original, np_Original , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Desativa", ::np_Desativa, np_Desativa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Acao", ::cp_Acao, cp_Acao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TrataAcao", ::np_TrataAcao, np_TrataAcao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</TrataPeca>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/TrataPeca",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cTrataPecaResult   :=  WSAdvValue( oXmlRet,"_TRATAPECARESPONSE:_TRATAPECARESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method TrataPecaOS of Service WSWSGuberman

WSMETHOD TrataPecaOS WSSEND np_CodigoEmpresa,np_NumeroOrdemServico,cp_CodigoPeca,cp_CodigoPecaAlternativa,cp_Posicao,np_NumeroRequisicao,cp_DataUtilizacao,np_QuantidadeRealizada,np_CustoUnitarioRealizado,np_CpfCnpjFornecedor,np_NumeroNF,cp_SerieNF,cp_DataEmissaoNF,np_Garantia,cp_Acao,np_TrataAcao WSRECEIVE cTrataPecaOSResult WSCLIENT WSWSGuberman
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<TrataPecaOS xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroOrdemServico", ::np_NumeroOrdemServico, np_NumeroOrdemServico , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoPeca", ::cp_CodigoPeca, cp_CodigoPeca , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoPecaAlternativa", ::cp_CodigoPecaAlternativa, cp_CodigoPecaAlternativa , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Posicao", ::cp_Posicao, cp_Posicao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroRequisicao", ::np_NumeroRequisicao, np_NumeroRequisicao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataUtilizacao", ::cp_DataUtilizacao, cp_DataUtilizacao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_QuantidadeRealizada", ::np_QuantidadeRealizada, np_QuantidadeRealizada , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CustoUnitarioRealizado", ::np_CustoUnitarioRealizado, np_CustoUnitarioRealizado , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpjFornecedor", ::np_CpfCnpjFornecedor, np_CpfCnpjFornecedor , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroNF", ::np_NumeroNF, np_NumeroNF , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_SerieNF", ::cp_SerieNF, cp_SerieNF , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataEmissaoNF", ::cp_DataEmissaoNF, cp_DataEmissaoNF , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Garantia", ::np_Garantia, np_Garantia , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Acao", ::cp_Acao, cp_Acao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TrataAcao", ::np_TrataAcao, np_TrataAcao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</TrataPecaOS>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/TrataPecaOS",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cTrataPecaOSResult :=  WSAdvValue( oXmlRet,"_TRATAPECAOSRESPONSE:_TRATAPECAOSRESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method TrataServico of Service WSWSGuberman

WSMETHOD TrataServico WSSEND np_CodigoEmpresa,np_CodigoServico,cp_NomeServico,np_QuantidadeHorasPadrao,np_CodigoGrupo,np_CodigoSubgrupo,np_ValorPadrao,np_Inativo,cp_Acao,np_TrataAcao WSRECEIVE cTrataServicoResult WSCLIENT WSWSGuberman
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<TrataServico xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoServico", ::np_CodigoServico, np_CodigoServico , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NomeServico", ::cp_NomeServico, cp_NomeServico , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_QuantidadeHorasPadrao", ::np_QuantidadeHorasPadrao, np_QuantidadeHorasPadrao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoGrupo", ::np_CodigoGrupo, np_CodigoGrupo , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoSubgrupo", ::np_CodigoSubgrupo, np_CodigoSubgrupo , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_ValorPadrao", ::np_ValorPadrao, np_ValorPadrao , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Inativo", ::np_Inativo, np_Inativo , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Acao", ::cp_Acao, cp_Acao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TrataAcao", ::np_TrataAcao, np_TrataAcao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</TrataServico>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/TrataServico",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cTrataServicoResult :=  WSAdvValue( oXmlRet,"_TRATASERVICORESPONSE:_TRATASERVICORESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method TrataServicoOS of Service WSWSGuberman

WSMETHOD TrataServicoOS WSSEND np_CodigoEmpresa,np_NumeroOrdemServico,np_CodigoServico,cp_DataRealizacao,np_CpfCnpjRecurso,np_TempoGastoRealizacaoServico,np_ValorHoraRecurso,np_CpfCnpjFornecedor,np_NumeroNF,cp_SerieNF,cp_DataEmissaoNF,np_ValorRealizado,np_Garantia,cp_Acao,np_TrataAcao WSRECEIVE cTrataServicoOSResult WSCLIENT WSWSGuberman
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<TrataServicoOS xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroOrdemServico", ::np_NumeroOrdemServico, np_NumeroOrdemServico , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoServico", ::np_CodigoServico, np_CodigoServico , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataRealizacao", ::cp_DataRealizacao, cp_DataRealizacao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpjRecurso", ::np_CpfCnpjRecurso, np_CpfCnpjRecurso , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TempoGastoRealizacaoServico", ::np_TempoGastoRealizacaoServico, np_TempoGastoRealizacaoServico , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_ValorHoraRecurso", ::np_ValorHoraRecurso, np_ValorHoraRecurso , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CpfCnpjFornecedor", ::np_CpfCnpjFornecedor, np_CpfCnpjFornecedor , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_NumeroNF", ::np_NumeroNF, np_NumeroNF , "long", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_SerieNF", ::cp_SerieNF, cp_SerieNF , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_DataEmissaoNF", ::cp_DataEmissaoNF, cp_DataEmissaoNF , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_ValorRealizado", ::np_ValorRealizado, np_ValorRealizado , "decimal", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Garantia", ::np_Garantia, np_Garantia , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Acao", ::cp_Acao, cp_Acao , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_TrataAcao", ::np_TrataAcao, np_TrataAcao , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</TrataServicoOS>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/TrataServicoOS",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cTrataServicoOSResult :=  WSAdvValue( oXmlRet,"_TRATASERVICOOSRESPONSE:_TRATASERVICOOSRESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method DesativaPeca of Service WSWSGuberman

WSMETHOD DesativaPeca WSSEND np_CodigoEmpresa,cp_CodigoPeca,cp_CodigoPecaAlternativa,np_Desativa WSRECEIVE cDesativaPecaResult WSCLIENT WSWSGuberman
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<DesativaPeca xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoPeca", ::cp_CodigoPeca, cp_CodigoPeca , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoPecaAlternativa", ::cp_CodigoPecaAlternativa, cp_CodigoPecaAlternativa , "string", .F. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Desativa", ::np_Desativa, np_Desativa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</DesativaPeca>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/DesativaPeca",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cDesativaPecaResult :=  WSAdvValue( oXmlRet,"_DESATIVAPECARESPONSE:_DESATIVAPECARESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method DesativaServico of Service WSWSGuberman

WSMETHOD DesativaServico WSSEND np_CodigoEmpresa,np_CodigoServico,np_Desativa WSRECEIVE cDesativaServicoResult WSCLIENT WSWSGuberman
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<DesativaServico xmlns="http://tempuri.org/">'
cSoap += WSSoapValue("p_CodigoEmpresa", ::np_CodigoEmpresa, np_CodigoEmpresa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_CodigoServico", ::np_CodigoServico, np_CodigoServico , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += WSSoapValue("p_Desativa", ::np_Desativa, np_Desativa , "int", .T. , .F., 0 , NIL, .F.) 
cSoap += "</DesativaServico>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://tempuri.org/DesativaServico",; 
	"DOCUMENT","http://tempuri.org/",,,; 
	"http://192.168.15.25/WSGuberman.asmx")

::Init()
::cDesativaServicoResult :=  WSAdvValue( oXmlRet,"_DESATIVASERVICORESPONSE:_DESATIVASERVICORESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.



