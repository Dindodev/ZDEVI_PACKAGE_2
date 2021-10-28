*&---------------------------------------------------------------------*
*& Report Z12R_CALCULATOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z12R_CALCULATOR.


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
          MESSAGE 'Division by 0 is not possible. Please enter proper data' TYPE 'E'.
        ELSE.
        result = operand1 / operand2.
        ENDIF.
      WHEN '%'.

        PERFORM sub_percentage USING operand1 operand2 CHANGING result.



      WHEN OTHERS.
        MESSAGE 'Please enter right operator [+,-,*,/]' TYPE 'E'.

    ENDCASE.


    WRITE :/ 'Result:', result.
*&---------------------------------------------------------------------*
*& Form SUB_PERCENTAGE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> OPERAND1
*&      --> OPERAND2
*&      <-- RESULT
*&---------------------------------------------------------------------*
FORM sub_percentage  USING    operand1
                              operand2
                     CHANGING result.

  result = ( operand1 / operand2 ) * 100.

ENDFORM.
