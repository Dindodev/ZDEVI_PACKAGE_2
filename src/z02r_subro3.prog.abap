*&---------------------------------------------------------------------*
*& Report Z02R_SUBRO3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02r_subro3.

DATA: gv_var1 TYPE i VALUE 5,
      gv_var2 TYPE i VALUE 4,
      gv_result TYPE p DECIMALS 2.



START-OF-SELECTION.





"call function module to compute the percentage

CALL FUNCTION 'Z02F_MOD'
  EXPORTING
    iv_var1       = gv_var1
    iv_var2       = gv_var2
 IMPORTING
   EV_RES        =  gv_result.

write : gv_result.
          .
