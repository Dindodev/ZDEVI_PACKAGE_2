*&---------------------------------------------------------------------*
*& Report Z03R_DAY3_ASSIGNMENT_2_PART_12
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03r_day3_assignment_2_part_12.
* variables declaration
PARAMETERS : gp_var1 TYPE i OBLIGATORY,
             gp_var2 TYPE i OBLIGATORY.

*declaring data
DATA : gp_res TYPE p DECIMALS 3.

* Start of Selection
START-OF-SELECTION.
*calling the subrutine
PERFORM calc_percentage USING gp_var1 gp_var2 CHANGING gp_res.

*writing the result on screen.
WRITE : / 'The result is = '.
WRITE : gp_res.


* defining the subroutine
*&---------------------------------------------------------------------*
*& Form CALC_PERCENTAGE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> GP_VAR1  - first numbet
*&      --> GP_VAR2  - second number
*&      <-- GP_RES - result
*&---------------------------------------------------------------------*
FORM calc_percentage  USING    p_gp_var1
                               p_gp_var2
                      CHANGING p_gp_res.

p_gp_res =  ( p_gp_var1 / p_gp_var2 ) * 100.

ENDFORM.
