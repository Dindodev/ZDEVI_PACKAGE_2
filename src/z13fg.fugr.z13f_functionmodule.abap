FUNCTION Z13F_FUNCTIONMODULE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LV_VAR1) TYPE  I
*"     VALUE(LV_VAR2) TYPE  I
*"  EXPORTING
*"     VALUE(EV_RESULT) TYPE  P
*"----------------------------------------------------------------------
EV_RESULT = ( LV_VAR1 / LV_VAR2 ) * 100 .




ENDFUNCTION.
