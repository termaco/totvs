#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"


USER FUNCTION MT410TOK

Local lRet      := .T.				// Conteudo de retorno
Local nOpc      := PARAMIXB[1]		// Opcao de manutencao

IF nOpc == 1 .OR. nOpc == 4 

	IF SC5->C5_YORIGEM="M"
		lRet:=.F.
		MSGINFO("Aten��o: Este pedido foi inserido atrav�s de integra��o com o Modal e somente pode ser excluido/alterado da mesma forma. Verifique.")
	ENDIF

ENDIF

Return(lRet)

