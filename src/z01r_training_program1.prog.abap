*&---------------------------------------------------------------------*
*& Report Z01R_TRAINING_PROGRAM1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01R_TRAINING_PROGRAM1.

PARAMETERS : p_var1(2) TYPE i OBLIGATORY,
             p_var2(2) TYPE i OBLIGATORY,
             p_oper(12) type c OBLIGATORY.


data gv_result type f.

case p_oper.
  when '+'.
    gv_result = p_var1 + p_var2.
  when '-'.
    gv_result = p_var1 - p_var2.
  when '*'.
    gv_result = p_var1 * p_var2.
  when '/'.
     IF P_VAR2 eq 0.
      message 'division by 0 is invalid' type 'E' .
      ENDIF.
    gv_result = p_var1 / p_var2.

ENDCASE.

write gv_result.
MESSAGE 'gv_result' type 'I'.
