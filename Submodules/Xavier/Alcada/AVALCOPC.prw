#Include 'Protheus.ch'
//Manipula Pedido de Compras
//LOCALIZAÇÃO   :  Function MaAvalCot - Função responsável pelos eventos do processo das cotações de compras
//EM QUE PONTO :  O ponto se encontra no final do evento 4 da MaAvalCot (Analise da Cotação) após a gravação de cada PC gerado a partir da cotação vencedora da analise da cotação. e pode ser utilizado para manipular o pedido de compras  tabela SC7.
//AUTOR: SAULO GOMES MARTINS

User Function AVALCOPC()
Local aArea		:= GetArea()
Local aAreaSC7	:= SC7->(GetArea())
Local aAreaSC8	:= SC8->(GetArea())
Local aAreaSC1	:= SC1->(GetArea())
Private cNumCotacao	:= SC8->C8_NUM

MsUnLockAll()
//EndTran()
If ExistBlock("MT120FIM")	//Envia para o PE tratar a divisão de centro de custo diferentes
	Execblock("MT120FIM",.F.,.F.,{3,SC7->C7_NUM,1})
EndIf

RestArea(aAreaSC1)
RestArea(aAreaSC7)
RestArea(aAreaSC8)
RestArea(aArea)

Return