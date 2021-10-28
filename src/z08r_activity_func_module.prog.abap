*&---------------------------------------------------------------------*
*& Report Z08R_ACTIVITY_FUNC_MODULE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z08R_ACTIVITY_FUNC_MODULE.
DATA : gv_var1 TYPE i VALUE 12,
      gv_var2 TYPE i VALUE 120,
      gv_res TYPE p.



CALL FUNCTION 'Z08F_MYFUN'
  EXPORTING
    lv_var1       = gv_var1
    lv_var2       = gv_var2
       IMPORTING
         lv_res = gv_res.   .

write gv_res.
