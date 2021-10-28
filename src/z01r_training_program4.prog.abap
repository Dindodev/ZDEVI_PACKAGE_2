*&---------------------------------------------------------------------*
*& Report Z01R_TRAINING_PROGRAM4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*



REPORT Z01R_TRAINING_PROGRAM4.

PARAMETERS : gv_var1 type i,
      gv_var2 type i.

DATA : gv_res type p decimals 2.

CALL FUNCTION 'Z01F_FUNCTIONMODULE'
  EXPORTING
    iv_var1       = gv_var1
    iv_var2       = gv_var2
 IMPORTING
   EV_RES        =  gv_res
          .


 write : / GV_RES.
