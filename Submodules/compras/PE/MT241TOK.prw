#Include 'Protheus.ch'
//Autor: Saulo Gomes Martins
//Data : 22/07/2013
//Descri��o: Valida inclus�o de movimento - Tem a finalidade de ser utilizado como valida��o da inclus�o do movimento pelo usu�rio.
User Function MT241TOK()
Local aArea	:= GetArea()
Local lRet := .T.
lRet	:= u_ySD3Guberman("C",.T.)
RestArea(aArea)
Return lRet