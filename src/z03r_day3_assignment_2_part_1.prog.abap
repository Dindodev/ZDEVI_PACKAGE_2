*&---------------------------------------------------------------------*
*& Report Z03R_DAY3_ASSIGNMENT_2_PART_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03r_day3_assignment_2_part_1.

* variables declaration
PARAMETERS : gp_var1 TYPE i OBLIGATORY,
             gp_var2 TYPE i OBLIGATORY,

             gp_op   TYPE c OBLIGATORY.

*declaring data
DATA : gp_res TYPE p DECIMALS 2.

* Start of Selection
START-OF-SELECTION.
* calling the subroutine for airthmatic operation
  PERFORM airth_operation USING gp_var1 gp_var2 gp_op CHANGING gp_res.
*&---------------------------------------------------------------------*
*& Form AIRTH_OPERATION
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> GP_VAR1  - first parameter
*&      --> GP_VAR2 - second parameter
*&      --> GP_OP - opeartor
*&      <-- GP_RES result
*&---------------------------------------------------------------------*
FORM airth_operation  USING    p_gp_var1
                               p_gp_var2
                               p_gp_op
                      CHANGING p_gp_res.

  CASE p_gp_op.
    WHEN '+'.
      p_gp_res = p_gp_var1 + p_gp_var2.
      WRITE 'The Summation is = '.
      WRITE p_gp_res.
    WHEN '-'.
      p_gp_res = p_gp_var1 - p_gp_var2.
      WRITE 'The Difference is = '.
      WRITE p_gp_res.
    WHEN '*'.
      p_gp_res = p_gp_var1 * p_gp_var2.
      WRITE 'The Multiplication is = '.
      WRITE p_gp_res.
    WHEN '/'.
      IF p_gp_var2 IS INITIAL.
        MESSAGE 'second parameter should not be blank' TYPE 'E'.
      ELSEIF p_gp_var2 = 0.
        MESSAGE 'divide by zero is not applicable' TYPE 'E'.
      ELSE.
        p_gp_res = p_gp_var1 / p_gp_var2.
        WRITE 'The Division is = '.
        WRITE p_gp_res.
      ENDIF.
    WHEN '%'.
*       Calling a new subrutine when operand is %
      PERFORM calc_percentage USING p_gp_var1 p_gp_var2 CHANGING p_gp_res.
      WRITE 'The % is = '.
      WRITE p_gp_res.
    WHEN OTHERS.
      MESSAGE 'Please Enter correct Operator  - +, -, *, /, %' TYPE 'E'.
  ENDCASE.


ENDFORM.

* Calculating the precentage
*&---------------------------------------------------------------------*
*& Form CALC_PERCENTAGE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> P_GP_VAR1 - input
*&      --> P_GP_VAR2 - output
*&      <-- P_GP_VRES - result
*&---------------------------------------------------------------------*
FORM calc_percentage  USING    p_gp_var1
                               p_gp_var2
                      CHANGING p_gp_res.
  p_gp_res =  ( p_gp_var1 / p_gp_var2 ) * 100.


ENDFORM.
