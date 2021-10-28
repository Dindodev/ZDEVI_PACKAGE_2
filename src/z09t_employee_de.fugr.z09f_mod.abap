FUNCTION Z09F_MOD.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_VAR1) TYPE  I OPTIONAL
*"     REFERENCE(IV_VAR2) TYPE  I OPTIONAL
*"  EXPORTING
*"     VALUE(EV_RESULT) TYPE  P
*"----------------------------------------------------------------------



  ev_result = ( iv_var1 / iv_var2 ) * 100.




ENDFUNCTION.
