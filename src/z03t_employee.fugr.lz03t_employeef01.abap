*----------------------------------------------------------------------*
***INCLUDE LZ03T_EMPLOYEEF01.
*----------------------------------------------------------------------*

FORM Z03_EVENT_EXP.

  IF Z03T_EMPLOYEE-EXPERIENCE GE 15.
    MESSAGE 'EXPERIENCE SHOULD  NOT BE GREATER THAN 15' TYPE 'E'.
  ENDIF.

ENDFORM.
