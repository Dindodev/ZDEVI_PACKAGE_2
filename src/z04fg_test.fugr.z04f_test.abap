FUNCTION z04f_test.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_PERCENTAGE) TYPE  I
*"     VALUE(IV_TOTAL) TYPE  I
*"  EXPORTING
*"     VALUE(EV_RESULT) TYPE  P
*"----------------------------------------------------------------------

   ev_result = ( iv_total / 100 ) * iv_percentage.




ENDFUNCTION.
