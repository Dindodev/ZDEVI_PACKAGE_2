*&---------------------------------------------------------------------*
*& Report Z04R_PROGRAM_ASSIGNMENT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04r_program_assignment.

TABLES : bkpf.

PARAMETERS : lp_val1 TYPE i OBLIGATORY,
             lp_val2 TYPE i OBLIGATORY,
             lp_val3 TYPE c OBLIGATORY.
DATA:       lp_result TYPE i.

IF lp_val3 = '+'.
  lp_result = lp_val1 + lp_val2.
  WRITE 'The summation is lp_result' .
  WRITE lp_result.



ELSEIF lp_val3 = '-'.
  lp_result = lp_val1 - lp_val2.
  WRITE 'The Difference is lp_result'.
  WRITE lp_result .

ELSEIF lp_val3 = '*'.
  lp_result = lp_val1 * lp_val2.
  WRITE 'The multiplication result is lp_result'.
  WRITE lp_result .


ELSEIF lp_val3 = '/'.
  IF lp_val2 = ''.
    MESSAGE 'Enter value' TYPE 'E'.
    ELSE.
  lp_result = lp_val1 / lp_val2.
  WRITE 'The Division result is p_result'.
  WRITE lp_result.
  ENDIF.
ENDIF.
