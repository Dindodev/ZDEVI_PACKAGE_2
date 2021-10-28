*&---------------------------------------------------------------------*
*& Report Z04SR_DIVISION_SUBROUTINE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z04SR_DIVISION_SUBROUTINE.

PARAMETERS: lv_val1 type i,
            lv_val2 type i,
            lv_val3 type c.

TYPES : lv_val4 type i.

START-OF-SELECTION.
 PERFORM div_calculation USING lv_val1 lv_val2 lv_val3 CHANGING lv_val4.
*&---------------------------------------------------------------------*
*& Form DIV_CALCULATION
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> LV_VAL1
*&      --> LV_VAL2
*&      --> LV_VAL3
*&      <-- LV_VAL4
*&---------------------------------------------------------------------*
FORM div_calculation  USING    p_lv_val1
                               p_lv_val2
                               p_lv_val3
                      CHANGING p_lv_val4.


  IF p_lv_val3 = '%'.


p_lv_val4 = p_lv_val1 % p_lv_val2.
write 'The result is '.
write p_lv_val4.

ENDIF.


ENDFORM.
