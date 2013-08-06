#Include 'Protheus.ch'
//Autor: Saulo Gomes Martins
//Data : 22/06/2013
//Descrição: PE para integração com Guberman
User Function A100DEL()
Local aArea	:= GetArea()
Local lRet := .T.
lRet	:= u_ySD1Guberman("C",.T.)
RestArea(aArea)
Return lRet