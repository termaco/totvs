#Include 'Protheus.ch'
//Autor: Saulo Gomes Martins
//Data : 22/07/2013
//Descrição: Valida inclusão de movimento - Tem a finalidade de ser utilizado como validação da inclusão do movimento pelo usuário.
User Function MT241TOK()
Local aArea	:= GetArea()
Local lRet := .T.
lRet	:= u_ySD3Guberman("C",.T.)
RestArea(aArea)
Return lRet