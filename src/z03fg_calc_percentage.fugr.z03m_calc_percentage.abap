FUNCTION Z03M_CALC_PERCENTAGE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(PARAM1) TYPE  I
*"     VALUE(PARAM2) TYPE  I
*"  EXPORTING
*"     VALUE(PERCENTAGE) TYPE  P
*"----------------------------------------------------------------------


PERCENTAGE = ( PARAM1 / PARAM2 ) * 100.


ENDFUNCTION.
