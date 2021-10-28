*&---------------------------------------------------------------------*
*& Report Z13R_CALCULATOR_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z13r_calculator_program.

 PARAMETERS : p_svalue TYPE i OBLIGATORY,
                 p_fvalue TYPE i OBLIGATORY,
                 pop TYPE c OBLIGATORY.



DATA: operand1 TYPE i,
          operand2 TYPE i,
          operator TYPE c,
          result   TYPE i.

    operand1 = p_svalue.
    operand2 = p_fvalue.
    operator = pop.


    CASE operator.
      WHEN '+'.
        result = operand1 + operand2.
      WHEN '-'.
        result = operand1 - operand2.
      WHEN '*'.
          result = operand1 * operand2.
      WHEN '/'.
        IF operand2 IS INITIAL.
          MESSAGE 'Division by 0 is not possible. Please enter proper data' TYPE 'E'.
        ELSE.
        result = operand1 / operand2.
        ENDIF.



      WHEN OTHERS.
        MESSAGE 'Please enter right operator [+,-,*,/]' TYPE 'E'.

    ENDCASE.


    WRITE :/ 'Result:', result.
