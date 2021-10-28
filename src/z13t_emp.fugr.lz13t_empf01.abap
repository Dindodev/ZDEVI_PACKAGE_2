*----------------------------------------------------------------------*
***INCLUDE LZ13T_EMPF01.
*----------------------------------------------------------------------*

FORM Z13_EVENT_EXP.
  IF Z13T_EMP-EXPERIENCE GT '15'.

   MESSAGE 'Please enter experience less than 15' TYPE 'E'.

    ENDIF.

 ENDFORM.
