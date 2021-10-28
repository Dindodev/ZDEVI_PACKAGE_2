*&---------------------------------------------------------------------*
*& Report Z10R_CALCULATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z10R_CALCULATE.


    SELECTION-SCREEN BEGIN OF BLOCK x WITH FRAME.

    PARAMETERS : po1 TYPE i OBLIGATORY,
                 po2 TYPE i OBLIGATORY,
                 pop TYPE c OBLIGATORY.

    SELECTION-SCREEN END OF BLOCK x.


    DATA: operand1 TYPE i,
          operand2 TYPE i,
          operator TYPE c,
          result   TYPE i.

    operand1 = po1.
    operand2 = po2.
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
          MESSAGE 'Division by 0 is not possible' TYPE 'E'.
        ELSE.
        result = operand1 / operand2.
        ENDIF.
      WHEN OTHERS.
        MESSAGE 'Please enter the correct operator [+,-,*,/]' TYPE 'E'.

    ENDCASE.


    WRITE:/ 'Result', result.
