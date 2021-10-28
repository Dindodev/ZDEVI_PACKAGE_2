*----------------------------------------------------------------------*
***INCLUDE LZ02T_EMP_DETF01.
*----------------------------------------------------------------------*
FORM NEW_ENTRY.
IF Z02T_EMP_DET-EXP GT '15'.
  MESSAGE 'CHANGE THE EXPERIENCE' TYPE 'I'.
  ENDIF.
ENDFORM.
