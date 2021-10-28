FUNCTION z07f_calculate.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LV_VALUE1) TYPE  P
*"     VALUE(LV_VALUE2) TYPE  P
*"  EXPORTING
*"     VALUE(RESULT) TYPE  P
*"----------------------------------------------------------------------
  result = ( lv_value1 / lv_value2 ) * 100.

ENDFUNCTION.
