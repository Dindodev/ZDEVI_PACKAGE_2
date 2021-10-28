FUNCTION Z08F_MYFUN.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LV_VAR1) TYPE  I
*"     VALUE(LV_VAR2) TYPE  I
*"  EXPORTING
*"     REFERENCE(LV_RES) TYPE  P
*"----------------------------------------------------------------------
LV_RES = ( LV_VAR1 / LV_VAR2 ) * 100.




ENDFUNCTION.
