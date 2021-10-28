FUNCTION Z03F_CALC_PERCENTAGE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_VAR1) TYPE  I - parameter one
*"     VALUE(IV_VAR2) TYPE  I - parameter two
*"  EXPORTING
*"     VALUE(IV_RESULT) TYPE  P - for storing result
*"----------------------------------------------------------------------

* calculating the percentage
IV_RESULT = ( IV_VAR1 / IV_VAR2 ) * 100.



ENDFUNCTION.
