*----------------------------------------------------------------------*
***INCLUDE LZ03T_EMPLOYEEF05.
*----------------------------------------------------------------------*

FORM VALIDATION.

  IF Z03T_EMPLOYEE-EXPERIENCE GT 15.
    MESSAGE 'EXP SHOULD NOT BE GREATER THAN 15' TYPE 'E'.
  ENDIF.

ENDFORM.
