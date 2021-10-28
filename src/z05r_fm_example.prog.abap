*&---------------------------------------------------------------------*
*& Report Z05R_FM_EXAMPLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z05R_FM_EXAMPLE.
PARAMETERS :lv_num1 TYPE i,
      lv_num2 TYPE i,
      lv_ops TYPE c.
DATA :
      gv_num3 TYPE i.

PERFORM arithmetic using lv_num1 lv_num2 lv_ops CHANGING gv_num3.
Write: 'Result is', gv_num3.
*&---------------------------------------------------------------------*
*& Form ARITHMETIC
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> LV_NUM1
*&      --> LV_NUM2
*&      <-- GV_NUM3
*&---------------------------------------------------------------------*
FORM arithmetic  USING    p_lv_num1
                          p_lv_num2
                          p_lv_operator
                 CHANGING gv_num3.
  CASE p_lv_operator.
    WHEN '+'.
      gv_num3 = p_lv_num1 + p_lv_num2.
    WHEN '-'.
       gv_num3 = p_lv_num1 - p_lv_num2.
    WHEN '*'.
       gv_num3 = p_lv_num1 * p_lv_num2.
    WHEN '/'.
        gv_num3 = p_lv_num1 / p_lv_num2.
     WHEN '%'.
     CALL FUNCTION 'Z05FM_CALCPERC'
          EXPORTING
            num1             = p_lv_num1
            num2             = p_lv_num2
         IMPORTING
           PERCENTAGE       = gv_num3.

    WHEN OTHERS.
      write /: 'Enter a correct operation'.
    ENDCASE.


ENDFORM.
