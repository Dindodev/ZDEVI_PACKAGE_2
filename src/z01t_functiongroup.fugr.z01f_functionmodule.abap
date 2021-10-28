FUNCTION Z01F_FUNCTIONMODULE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_VAR1) TYPE  I
*"     VALUE(IV_VAR2) TYPE  I
*"  EXPORTING
*"     VALUE(EV_RES) TYPE  P
*"----------------------------------------------------------------------


 EV_RES = IV_VAR1 / IV_VAR2 * 100 .


ENDFUNCTION.
