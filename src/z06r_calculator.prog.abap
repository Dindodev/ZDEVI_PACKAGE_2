*&---------------------------------------------------------------------*
*& Report Z06R_CALCULATOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z06R_CALCULATOR.


DATA : lv_result  TYPE int1.

PARAMETERS: lv_oper TYPE c, lv_var1 TYPE i,lv_var2 TYPE i.

CASE lv_oper.
  WHEN '+'.
    lv_result = lv_var1 + lv_var2.
    WRITE 'The summation is '.
    WRITE lv_result.
  WHEN  '-'.
    lv_result = lv_var1 - lv_var2.
    WRITE 'The difference is '.
    WRITE lv_result.
  WHEN '*'.
    lv_result = lv_var1 * lv_var2.
    WRITE 'The product is '.
    WRITE lv_result.
  WHEN '/'.
    IF ( lv_var2 EQ 0 ).
      MESSAGE 'The second number should not be zero' TYPE 'E'.
    ENDIF.
    RETURN.
    WRITE 'The division is '.
    WRITE lv_result.

ENDCASE.
