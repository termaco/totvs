#Include 'Protheus.ch'
//Autor: Saulo Gomes Martins
//Data : 22/06/2013
//Descrição: PE para integração com Guberman
User Function MT103FIM()
Local aArea	:= GetArea()
Local nOpcao := PARAMIXB[1]
Local lRet := .T.
If nOpcao==3 .or. nOpcao==4		//Incluir, Classificar
	u_ySD1Guberman("I",.F.)
EndIF
RestArea(aArea)
Return lRet