*&---------------------------------------------------------------------*
*& Report Z08R_ACTIVITY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z08r_activity.

PARAMETERS : lv_var1(2) TYPE i obligatory,
             lv_var2(2) TYPE i obligatory,
             lv_opr(12) TYPE c.


DATA lv_res TYPE p.

CASE lv_opr.
  WHEN '+'.
    lv_res = lv_var1 + lv_var2.
    WRITE 'The summation is '.
    WRITE lv_res.
  WHEN '-'.
    lv_res = lv_var1 - lv_var2.
    WRITE 'The difference is '.
    WRITE lv_res.
  WHEN '*'.
    lv_res = lv_var1 * lv_var2.
    WRITE 'The product is '.
    WRITE lv_res.
  WHEN '/'.
    IF lv_var2 = 0.
       MESSAGE 'The second number should not be zero' TYPE 'E'.
       RETURN.

    ELSE.
      lv_res = lv_var1 / lv_var2.
      WRITE 'The result of division is '.
      WRITE lv_res.

    ENDIF.

ENDCASE.
