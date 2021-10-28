*&---------------------------------------------------------------------*
*& Report Z12R_MODULAR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z12R_MODULAR.

DATA: gv_var1 TYPE i VALUE 5,
      gv_var2 TYPE i VALUE 4,
      gv_result TYPE p DECIMALS 2.



START-OF-SELECTION.
"Perform arithmetic operations using sub-routines
PERFORM sub_add USING gv_var1 gv_var2 CHANGING gv_result.
WRITE:/ 'Addition:', gv_result.
PERFORM sub_subtract USING gv_var1 gv_var2 CHANGING gv_result.
WRITE:/ 'Subtraction:', gv_result.
PERFORM sub_multiply USING gv_var1 gv_var2 CHANGING gv_result.
WRITE:/ 'Multilication:', gv_result.
PERFORM sub_divide USING gv_var1 gv_var2 CHANGING gv_result.
WRITE:/ 'Division:', gv_result.
PERFORM calc_percentage USING gv_var1 gv_var2 CHANGING gv_result.
WRITE:/ 'Percentage:', gv_result, '%'.





"call function module to compute the percentage

CALL FUNCTION 'Z12F_MOD'
  EXPORTING
    iv_var1         = gv_var1
    iv_var2         = gv_var2
 IMPORTING
   EV_RESULT       = gv_result
          .

WRITE:/ 'Percentage from Function Module:', gv_result, '%'.

*&---------------------------------------------------------------------*
*& Form SUB_ARITHMETIC
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> X
*&      --> Y
*&      <-- Z
*&---------------------------------------------------------------------*
FORM sub_add  USING    gv_var1
                              gv_var2
                     CHANGING gv_result.

  gv_result = gv_var1 + gv_var2.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form SUB_SUBTRACT
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> gv_var1
*&      --> gv_var2
*&      <-- gv_result
*&---------------------------------------------------------------------*
FORM sub_subtract  USING    gv_var1
                            gv_var2
                   CHANGING gv_result.

  gv_result = gv_var1 - gv_var2.

ENDFORM.




*&---------------------------------------------------------------------*
*& Form SUB_MULTIPLY
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> gv_var1
*&      --> gv_var2
*&      <-- gv_result
*&---------------------------------------------------------------------*
FORM sub_multiply  USING    gv_var1
                            gv_var2
                   CHANGING gv_result.

  gv_result = gv_var1 * gv_var2.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form SUB_DIVIDE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> gv_var1
*&      --> gv_var2
*&      <-- gv_result
*&---------------------------------------------------------------------*
FORM sub_divide  USING    gv_var1
                          gv_var2
                 CHANGING gv_result.

  gv_result = gv_var1 / gv_var2.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form CALC_PERCENTAGE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> gv_var1
*&      --> gv_var2
*&      <-- gv_result
*&---------------------------------------------------------------------*
FORM calc_percentage  USING    gv_var1
                               gv_var2
                      CHANGING gv_result.

  gv_result = ( gv_var1 / gv_var2 ) * 100.

ENDFORM.
