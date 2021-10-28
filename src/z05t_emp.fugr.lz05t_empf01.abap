*----------------------------------------------------------------------*
***INCLUDE LZ05T_EMPF01.
*----------------------------------------------------------------------*
form zcreate_entry.
 IF Z05T_EMP-EXPERIENCE GT 15.
   MESSAGE 'Please enter relevant and proper experience.' TYPE 'E'.
   ENDIF.
  endform.
