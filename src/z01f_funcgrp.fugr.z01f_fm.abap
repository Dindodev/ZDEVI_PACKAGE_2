FUNCTION Z01F_FM.
*"----------------------------------------------------------------------
*"*"Local Interface:
 IMPORTING
       VALUE(GV_VAR1)
       VALUE(GV_VAR2)
 EXPORTING
   REFERENCE(LV_RES)


LV_RES = ( ( GV_VAR1 / GV_VAR2 ) * 100 ) .






ENDFUNCTION.
