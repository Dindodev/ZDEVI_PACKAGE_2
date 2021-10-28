*----------------------------------------------------------------------*
***INCLUDE LZ09T_EMPLOYEE_DEF01.
FORM Z_Event_DOJ.

IF Z09T_EMPLOYEE_DE-EXPERIENCE GT 15.
Message 'Enter Valid Experiance' TYPE 'E'.

ENDIF.

ENDFORM.
