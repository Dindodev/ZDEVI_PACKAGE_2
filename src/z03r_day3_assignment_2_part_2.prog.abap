*&---------------------------------------------------------------------*
*& Report Z03R_DAY3_ASSIGNMENT_2_PART_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03R_DAY3_ASSIGNMENT_2_PART_2.

* variables declaration
PARAMETERS : gp_var1 TYPE i OBLIGATORY,
             gp_var2 TYPE i OBLIGATORY.

*declaring data
DATA : gp_res TYPE P DECIMALS 2.

*start selection
START-OF-SELECTION.

* Calling the function Module
CALL FUNCTION 'Z03F_CALC_PERCENTAGE'
  EXPORTING
    iv_var1         = gp_var1
    iv_var2         = gp_var2
 IMPORTING
   IV_RESULT       =   gp_res
          .
*WRITING THE RESULT ON SCREEN
WRITE : / 'The percentage is', gp_res.
