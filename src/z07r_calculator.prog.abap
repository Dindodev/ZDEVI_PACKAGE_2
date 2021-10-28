*&---------------------------------------------------------------------*
*& Report Z07R_CALCULATOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z07r_calculator.
DATA : lv_result  TYPE int1.

PARAMETERS: lv_op   TYPE c, lv_var1 TYPE i obligatory,lv_var2 TYPE i obligatory.

CASE lv_op.
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
