*&---------------------------------------------------------------------*
*& Report Z09P_MODULE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09p_module.

DATA : gv_var1 TYPE i VALUE 2,
      gv_var2 TYPE i VALUE 10,
      gv_result TYPE p DECIMALS 2.


"call function module

CALL FUNCTION 'Z09F_MODUL'
  EXPORTING
    iv_var1         = gv_var1
    iv_var2         = gv_var2
 IMPORTING
   ev_result       = gv_result.

write: gv_result ,'%'.
