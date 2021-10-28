*----------------------------------------------------------------------*
***INCLUDE LZ03T_EMPLOYEEF04.
*----------------------------------------------------------------------*

FORM Z03_EVENT_VALIDATION.
  IF Z03T_EMPLOYEE-EXPERIENCE GT 15.

    MESSAGE 'EXPERIENCE CANNOT BE GREATER THAN 15' TYPE 'E'.

  ENDIF.

ENDFORM.
