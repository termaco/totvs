#Include 'Protheus.ch'
//Autor: Saulo Gomes Martins
//Data : 22/06/2013
//Descrição: PE para integração com Guberman
User Function MT241EST()
Local aArea	:= GetArea()
Local lRet := .T.
u_ySD3Guberman("E",.F.)
RestArea(aArea)
Return lRet