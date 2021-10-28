FUNCTION Z10F_AIR_OPERATIONS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_ITM1) TYPE  P
*"     REFERENCE(IV_ITM2) TYPE  P
*"  EXPORTING
*"     REFERENCE(EV_ITM3) TYPE  P
*"----------------------------------------------------------------------


    ev_itm3 = ( iv_itm1 / iv_itm2 ) * 100.


ENDFUNCTION.
