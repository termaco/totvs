#Include 'Protheus.ch'
//Autor: Saulo Gomes Martins
//Data : 22/06/2013
//Descrição: PE para integração com Guberman
User Function MT100AG()
Local aArea	:= GetArea()
Local lRet := .T.
If !INCLUI .and. !ALTERA
	lRet	:= u_ySD1Guberman("E",.F.)
EndIF
RestArea(aArea)
Return lRet