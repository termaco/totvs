#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"


USER FUNCTION MT410TOK

Local lRet      := .T.				// Conteudo de retorno
Local nOpc      := PARAMIXB[1]		// Opcao de manutencao

IF nOpc == 1 .OR. nOpc == 4 

	IF SC5->C5_YORIGEM="M"
		lRet:=.F.
		MSGINFO("Atenção: Este pedido foi inserido através de integração com o Modal e somente pode ser excluido/alterado da mesma forma. Verifique.")
	ENDIF

ENDIF

Return(lRet)

