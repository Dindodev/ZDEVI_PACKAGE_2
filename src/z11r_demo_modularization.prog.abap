*&---------------------------------------------------------------------*
*& Report Z11R_DEMO_MODULARIZATION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z11R_DEMO_MODULARIZATION.

DATA :  gv_FVal type p value 100,
      gv_sVal type p value 12,
      gv_result type p DECIMALS 2.

PERFORM cal_Percentage USING gv_FVal gv_SVAL CHANGING gv_result.
WRITE : / 'Percentage calculated from Subroutine :' ,gv_result.

 call FUNCTION 'Z11F_MODULARIZEFN'
 EXPORTING
   FVALUE = gv_FVal
   SVALUE = gv_sVal
importing
 FRESULT = gv_result.
 WRITE : / 'Percentage calculated from FM :' ,gv_result.

*&---------------------------------------------------------------------*
*& Form CAL_PERCENTAGE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> GV_FVAL
*&      --> GV_SVAL
*&      <-- GV_RESULT
*&---------------------------------------------------------------------*
FORM cal_percentage  USING    p_gv_fval
                              p_gv_sval
                     CHANGING p_gv_result.

     p_gv_result = ( p_gv_fval / p_gv_sval ) * 100.

ENDFORM.
