*&---------------------------------------------------------------------*
*& Report Z02R_REPORT2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z02R_REPORT2.

PARAMETERS : lv_var1(2) TYPE i,
             lv_var2(2) TYPE i,
             lv_oper(12) type c.


data lv_result type f.

case lv_oper.
  when '+'.
    lv_result = lv_var1 + lv_var2.
  when '-'.
    lv_result = lv_var1 - lv_var2.
  when '*'.
    lv_result = lv_var1 + lv_var2.
  when '/'.

    lv_result = lv_var1 / lv_var2.

ENDCASE.

write lv_result.
