*&---------------------------------------------------------------------*
*& Report Z06R_SUBROUTINE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06r_subroutine.


DATA: numb1 TYPE i,
      numb2 TYPE i,
      numb3 TYPE i,
      per3  TYPE i.


numb1 = 7.
numb2 = 3.

PARAMETERS: per1 type i,
            per2 type i.

START-OF-SELECTION.

  PERFORM add_cal USING numb1 numb2 CHANGING numb3.

END-OF-SELECTION.

 START-OF-SELECTION.
 PERFORM percentage_cal USING per1 per2 CHANGING per3.
 End-of-Selection.
*&---------------------------------------------------------------------*
*& Form ADD_CAL
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> NUMB1
*&      --> NUMB2
*&      <-- NUMB3
*&---------------------------------------------------------------------*
FORM add_cal  USING    p_numb1 TYPE i
                       p_numb2 TYPE i
              CHANGING p_numb3 TYPE i.

  p_numb3 = p_numb1 + p_numb2.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form PERCENTAGE_CAL
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> PER1
*&      --> PER2
*&      <-- PER3
*&---------------------------------------------------------------------*
FORM percentage_cal  USING    p_per1 type i
                              p_per2 type i
                     CHANGING p_per3 type i.

  p_per3 = p_per2 / 100 * p_per1.
  write 'The Result value is: '.
  write p_per3.

ENDFORM.
