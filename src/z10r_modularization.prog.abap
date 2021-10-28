*&---------------------------------------------------------------------*
*& Report Z10R_MODULARIZATION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z10R_MODULARIZATION.

DATA : gv_var1 type i VALUE 20,
       gv_var2 TYPE i VALUE 22,
       gv_res1 TYPE i,
       gv_var3 TYPE p VALUE 200,
       gv_var4 TYPE p VALUE 20,
       gv_res2 TYPE p DECIMALS 2.

PERFORM sub_add USING gv_var1 gv_var2 CHANGING gv_res1.
  write: / 'Added Result', gv_res1.
PERFORM calc_percentage USING gv_var3 gv_var4 CHANGING gv_res2.
write: / 'Percentage', gv_res2.

CALL FUNCTION 'Z10F_AIR_OPERATIONS'
  EXPORTING
    iv_itm1       = gv_var3 + 1
    iv_itm2       = gv_var4 + 1
 IMPORTING
   EV_ITM3       = gv_res2.

write : / 'From function module', gv_res2.

*&---------------------------------------------------------------------*
*& Form SUB_ADD
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> A
*&      --> B
*&      <-- C
*&---------------------------------------------------------------------*
FORM sub_add  USING    gv_var1
                       gv_var2
              CHANGING gv_res1.

  gv_res1 = gv_var1 + gv_var2.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form CALC_PERCENTAGE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> GV_A
*&      --> GV_B
*&      <-- GV_C
*&---------------------------------------------------------------------*
FORM calc_percentage  USING    gv_var3
                               gv_var4
                      CHANGING gv_res2.

        gv_res2 = ( gv_var3 / gv_var4 ) * 100.

ENDFORM.
