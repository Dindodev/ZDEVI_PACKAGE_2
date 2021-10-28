*&---------------------------------------------------------------------*
*& Report Z04SR_PROGRAMFORSUBROUTINE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04sr_programforsubroutine.

DATA : gv_num1 TYPE i,
       gv_num2 TYPE i,
       gv_num3 TYPE i,
      gv_result TYPE p.


gv_num1 = 5.
gv_num2 = 7.

PARAMETERS: lp_per1 TYPE i,
            lp_per2 TYPE i.



START-OF-SELECTION.


  PERFORM calc_percentage

    USING lp_per1
          lp_per2
    CHANGING gv_result.

  PERFORM add_numbers.

  CALL FUNCTION 'Z04F_TEST'
    EXPORTING
      iv_percentage = lp_per1
      iv_total      = lp_per2
    IMPORTING
      ev_result     = gv_result.
  NEW-LINE.
  write 'The result of calculation using Function Module is'.
  WRITE gv_result.





*&---------------------------------------------------------------------*
*& Form ADD_NUMBERS
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM add_numbers .

  gv_num3 = gv_num1 + gv_num2.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form CALC_PERCENTAGE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> PER1
*&      --> PER2
*&      <-- PER3
*&---------------------------------------------------------------------*
FORM calc_percentage USING p_per1 TYPE i
                               p_per2 TYPE i
                      CHANGING p_per3 TYPE p.

  p_per3 = ( p_per2 / 100 ) * p_per1.
  WRITE 'The result value is'.
  WRITE p_per3.

ENDFORM.
