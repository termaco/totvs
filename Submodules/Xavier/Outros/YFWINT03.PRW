#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "RWMAKE.CH"

//--------------------------------------------------------------
/*                                                                
@author  - RAFAEL XAVIER                                              
@since 26/07/2013                                                   
*/                                                             
//--------------------------------------------------------------

User Function YFWINT03()                                      
Static oDlg
Static oButton1
Static oButton2
Static oGet1
Static oGet10
Static oGet11
Static oGet12
Static oGet13
Static oGet2
Static oGet3
Static oGet4
Static oGet5
Static oGet6
Static oGet7
Static oGet8
Static oGet9
Static oGroup1
Static oSay1
Static oSay10
Static oSay11
Static oSay12
Static oSay13
Static oSay2
Static oSay3
Static oSay4
Static oSay5
Static oSay6
Static oSay7
Static oSay8
Static oSay9
PRIVATE cGet1 := SC5->C5_NUM
PRIVATE cGet10 := SC5->C5_DATA3
PRIVATE cGet11 := SC5->C5_PARC4
PRIVATE cGet12 := SC5->C5_DATA4
PRIVATE cGet13 := SC5->C5_MENNOTA
PRIVATE cGet2 := SC5->C5_CLIENTE
PRIVATE cGet3 := SC5->C5_LOJACLI
PRIVATE cGet4 := POSICIONE("SA1",1,XFILIAL("SA1")+SC5->C5_CLIENTE+SC5->C5_LOJACLI,"A1_NOME")
PRIVATE cGet5 := SC5->C5_PARC1
PRIVATE cGet6 := SC5->C5_DATA1
PRIVATE cGet7 := SC5->C5_PARC2
PRIVATE cGet8 := SC5->C5_DATA2
PRIVATE cGet9 := SC5->C5_PARC3

  DEFINE MSDIALOG oDlg TITLE "Alteração de Pedido vindo do Modal" FROM 000, 000  TO 500, 800 COLORS 0, 16777215 PIXEL

    @ 028, 034 GROUP oGroup1 TO 240, 370 PROMPT "Alteração Pedido de Venda" OF oDlg COLOR 0, 16777215 PIXEL
    @ 040, 054 SAY oSay1 PROMPT "Pedido" SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 049, 055 MSGET oGet1 VAR cGet1 SIZE 047, 010 OF oDlg COLORS 0, 16777215 READONLY PIXEL
    @ 065, 054 SAY oSay2 PROMPT "Cliente" SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 073, 054 MSGET oGet2 VAR cGet2 SIZE 035, 010 OF oDlg COLORS 0, 16777215 READONLY PIXEL
    @ 065, 096 SAY oSay3 PROMPT "Loja" SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 073, 096 MSGET oGet3 VAR cGet3 SIZE 020, 010 OF oDlg COLORS 0, 16777215 READONLY PIXEL
    @ 065, 125 SAY oSay4 PROMPT "Razao Social" SIZE 038, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 073, 124 MSGET oGet4 VAR cGet4 SIZE 146, 010 OF oDlg COLORS 0, 16777215 READONLY PIXEL
    
    @ 096, 054 SAY oSay5 PROMPT "Parcela1" SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 106, 054 MSGET oGet5 VAR cGet5 SIZE 060, 010 OF oDlg COLORS 0, 16777215 PIXEL PICTURE "@E 999,999,999.99"
    @ 096, 133 SAY oSay6 PROMPT "Vencimento1" SIZE 033, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 106, 132 MSGET oGet6 VAR cGet6 SIZE 060, 010 OF oDlg COLORS 0, 16777215 PIXEL
    
    @ 120, 054 SAY oSay7 PROMPT "Parcela2" SIZE 025, 007 OF oGroup1 COLORS 0, 16777215 PIXEL
    @ 130, 054 MSGET oGet7 VAR cGet7 SIZE 060, 010 OF oGroup1 COLORS 0, 16777215 PIXEL PICTURE "@E 999,999,999.99"
    @ 120, 133 SAY oSay8 PROMPT "Vencimento2" SIZE 033, 007 OF oGroup1 COLORS 0, 16777215 PIXEL
    @ 130, 133 MSGET oGet8 VAR cGet8 SIZE 060, 010 OF oGroup1 COLORS 0, 16777215 PIXEL
    
    @ 145, 054 SAY oSay9 PROMPT "Parcela3" SIZE 025, 007 OF oGroup1 COLORS 0, 16777215 PIXEL
    @ 155, 054 MSGET oGet9 VAR cGet9 SIZE 060, 010 OF oGroup1 COLORS 0, 16777215 PIXEL PICTURE "@E 999,999,999.99"
    @ 145, 133 SAY oSay10 PROMPT "Vencimento3" SIZE 033, 007 OF oGroup1 COLORS 0, 16777215 PIXEL
    @ 155, 133 MSGET oGet10 VAR cGet10 SIZE 060, 010 OF oGroup1 COLORS 0, 16777215 PIXEL
    
    @ 170, 054 SAY oSay11 PROMPT "Parcela4" SIZE 025, 007 OF oGroup1 COLORS 0, 16777215 PIXEL
    @ 180, 054 MSGET oGet11 VAR cGet11 SIZE 060, 010 OF oGroup1 COLORS 0, 16777215 PIXEL PICTURE "@E 999,999,999.99"
    @ 170, 133 SAY oSay12 PROMPT "Vencimento4" SIZE 033, 007 OF oGroup1 COLORS 0, 16777215 PIXEL
    @ 180, 133 MSGET oGet12 VAR cGet12 SIZE 060, 010 OF oGroup1 COLORS 0, 16777215 PIXEL
    
    
    @ 195, 054 SAY oSay13 PROMPT "Mens.P/Nota" SIZE 036, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 205, 054 MSGET oGet13 VAR cGet13 SIZE 290, 010 OF oDlg COLORS 0, 16777215 PIXEL
    @ 227, 296 BUTTON oButton1 PROMPT "OK" SIZE 037, 012 OF oDlg PIXEL ACTION U_YFWIN03A()
    @ 227, 255 BUTTON oButton2 PROMPT "Cancela" SIZE 037, 012 OF oDlg ACTION oDlg:End() PIXEL
  ACTIVATE MSDIALOG oDlg

Return

USER FUNCTION YFWIN03A()
_PARC:=cGet5+cGet7+cGet9+cGet11

cQuery 	:= "SELECT SUM(C6_VALOR) VALTOT FROM "+RETSQLNAME("SC6")+" SC6 "
cQuery 	+= "WHERE C6_FILIAL='"+xFilial("SC6")+"' AND C6_NUM='"+SC5->C5_NUM+"' AND SC6.D_E_L_E_T_=' ' "
	
TcQuery cQuery New Alias T02

_TOTAL:=T02->VALTOT+SC5->C5_FRETE + SC5->C5_DESPESA + SC5->C5_SEGURO + SC5->C5_FRETAUT

T02->(DBCLOSEAREA())

IF  ROUND(_TOTAL,2)!= ROUND(_PARC,2)
	MSGINFO("Atenção: O valor das parcelas está diferente do valor do pedido. Verifique. Pedido:"+Str(_TOTAL)+" / Parcelas:"+Str(_PARC))
	RETURN
ENDIF

IF (!EMPTY(cGet5) .AND. EMPTY(cGet6) ) .OR. ( EMPTY(cGet5) .AND. !EMPTY(cGet6) )
	MSGINFO("Atenção os campos da parcelas não foram preenchidos corretamente. Para cada vencimento inserido, deve ter um valor correspondente de parcela.")
	RETURN
ELSEIF (!EMPTY(cGet7) .AND. EMPTY(cGet8)) .OR. (EMPTY(cGet7) .AND. !EMPTY(cGet8))
	MSGINFO("Atenção os campos da parcelas não foram preenchidos corretamente. Para cada vencimento inserido, deve ter um valor correspondente de parcela.")
	RETURN
ELSEIF (!EMPTY(cGet9) .AND. EMPTY(cGet10)) .OR. (EMPTY(cGet9) .AND. !EMPTY(cGet10))
	MSGINFO("Atenção os campos da parcelas não foram preenchidos corretamente. Para cada vencimento inserido, deve ter um valor correspondente de parcela.")
	RETURN
ELSEIF (!EMPTY(cGet11) .AND. EMPTY(cGet12)) .OR. (EMPTY(cGet11) .AND. !EMPTY(cGet12))
	MSGINFO("Atenção os campos da parcelas não foram preenchidos corretamente. Para cada vencimento inserido, deve ter um valor correspondente de parcela.")
	RETURN
ENDIF


  RECLOCK("SC5",.F.)
  SC5->C5_PARC1   :=cGet5
  SC5->C5_DATA1   :=cGet6
  SC5->C5_PARC2   :=cGet7
  SC5->C5_DATA2   :=cGet8
  SC5->C5_PARC3   :=cGet9
  SC5->C5_DATA3   :=cGet10
  SC5->C5_PARC4   :=cGet11
  SC5->C5_DATA4   :=cGet12
  SC5->C5_MENNOTA :=cGet13
  MSUNLOCK()
  oDlg:End()
RETURN
