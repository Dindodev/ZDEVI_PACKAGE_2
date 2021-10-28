*&---------------------------------------------------------------------*
*& Report Z07R_SUBROUTINE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z07r_subroutine.
PARAMETERS : var_a TYPE p LENGTH 3,
             var_b TYPE p LENGTH 3,
             op    TYPE c LENGTH 1.
DATA result TYPE p.

AT SELECTION-SCREEN.
  IF op NE '%'.
    MESSAGE 'Enter Percentage' TYPE 'E'.
  ENDIF.

START-OF-SELECTION.


  PERFORM calculate USING var_a var_b  CHANGING result.
  WRITE result.
  CALL FUNCTION 'Z07F_CALCULATE'
    EXPORTING
      lv_value1 = var_a
      lv_value2 = var_b
    IMPORTING
      result    = result.
  NEW-LINE.
  WRITE 'Functional Module Result'.
  WRITE result.






*&---------------------------------------------------------------------*
*& Form CALCULATE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> VAR_A
*&      --> VAR_B
*&      <-- RESULT
*&---------------------------------------------------------------------*
FORM calculate  USING    p_var_a
                         p_var_b

                CHANGING p_result.
  p_result = ( p_var_a / p_var_b ) * 100.


ENDFORM.
