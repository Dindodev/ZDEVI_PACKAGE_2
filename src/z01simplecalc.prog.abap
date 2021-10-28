*&---------------------------------------------------------------------*
*& Report Z01SIMPLECALC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01simplecalc.

PARAMETERS : lv_vara(2) TYPE i ,
             lv_varb(2) TYPE i  ,
             lv_varc(2) TYPE c  .

DATA : lv_res(4) TYPE p DECIMALS 2.



CASE lv_varc.
  WHEN '+'.
    lv_res = lv_vara + lv_varb.
  WHEN '-'.
    lv_res = lv_vara - lv_varb.
  WHEN '*'.
    lv_res = lv_vara * lv_varb.
  WHEN '/'.
    IF lv_varb eq 0.
      message 'division by 0 is invalid' type 'E' .
      endif.
    lv_res = lv_vara / lv_varb.

ENDCASE.

WRITE lv_res.
