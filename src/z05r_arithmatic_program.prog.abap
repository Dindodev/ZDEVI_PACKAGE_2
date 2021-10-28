*&---------------------------------------------------------------------*
*& Report Z05R_ARITHMATIC_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z05R_ARITHMATIC_PROGRAM.

PARAMETERS : p_var1 TYPE I, p_var2 TYPE I, p_math TYPE C.
DATA : lv_Result TYPE I.

CASE p_math.
  WHEN '+'.
    lv_Result = p_var1 + p_var2.
    write: 'Summation = ', lv_Result.
*    write 'Add'.
  WHEN '-'.
    lv_Result = p_var1 - p_var2.
    write: 'Difference = ', lv_Result.
  WHEN '*'.
     lv_Result = p_var1 * p_var2.
    write: 'Multiplication = ', lv_Result.
  WHEN '/'.
    IF p_var2 IS INITIAL.
      MESSAGE 'Enter a valid number.' TYPE 'E'.
      ELSE.
 lv_Result = p_var1 / p_var2.
    write: 'Division = ', lv_Result.
    ENDIF.
  WHEN OTHERS.
    write 'Other'.
 ENDCASE.
