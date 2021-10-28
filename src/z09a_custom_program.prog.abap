*-----------------------------------------------------------------*
*& Report Z09A_CUSTOM_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z09A_CUSTOM_PROGRAM.

PARAMETERS : p_a(2) TYPE I OBLIGATORY,
             p_b(2) TYPE I OBLIGATORY,
             p_oper(1) TYPE c OBLIGATORY .
DATA: lv_Result TYPE I.

CASE p_oper.

  when '+'.
    lv_Result = p_a + p_b.
    write: 'Addition is', lv_result.
  when '-'.
    lv_Result = p_a - p_b.
    write: 'Substraction is', lv_result.
  when '*'.
    lv_Result = p_a * p_b.
    write: 'Multiplication is', lv_result.
  when '/'.
    IF p_b > 0 .
    lv_Result = p_a / p_b.
    write: 'Division is', lv_result.
    ELSE.
      WRITE 'given 2nd variable is invalid'.
      lv_Result = 0 .
    ENDIF.
  when others.
      write: 'Given operator is invalid'.

ENDCASE.
