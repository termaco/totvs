#INCLUDE "Rwmake.ch"
#INCLUDE "Topconn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � MT120APV    �Autor  � Karlos Morais   � Data �  10/07/12   ���
�������������������������������������������������������������������������͹��
���Desc.     � Ponto de Entrada que altera o Grupo de Aprova��o conforme  ���
���          � Centro de Custos                                           ���
�������������������������������������������������������������������������͹��
���Uso       � Beach Park                                                 ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function MT120APV()

	Private cAlias	:= getNextAlias()
	Private cRet		:= SC7->C7_APROV
	Private nValor	:= 0
	Public cNum		:= SC7->C7_NUM
	
	BeginSql Alias cAlias
		
		SELECT
			CTT.CTT_YGPRES,
			SUM(SC7.C7_TOTAL) AS TOTAL
		FROM %table:SC7% SC7
			JOIN %table:CTT% CTT
				ON CTT.CTT_CUSTO = SC7.C7_CC
					AND CTT.CTT_FILIAL = SUBSTRING(SC7.C7_FILIAL,1,4)
		WHERE SC7.D_E_L_E_T_ <> '*'
			and SC7.C7_FILIAL = %xFilial:SC7%
			and SC7.C7_NUM = %Exp:cNum%
		GROUP BY
			CTT.CTT_YGPRES
		
	EndSql	   
 	
	(cAlias)->(dbGoTop())
	
	While !(cAlias)->(Eof())
	
		If ((cAlias)->TOTAL) > nValor
			nValor	:= ((cAlias)->TOTAL)
			cRet	:=((cAlias)->CTT_YGPRES) 			 
		EndIf
		
		(cAlias)->(dbSkip())
		
		If (cAlias)->(EOF())
			Exit
		EndIf
	
	EndDo
	
Return (cRet)
