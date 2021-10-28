*----------------------------------------------------------------------*
***INCLUDE LZ03_EMPMASTERF01.
*----------------------------------------------------------------------*

FORM Z03_EVENT_DOJ.

  IF Z03T_EMPMASTER-EMPDOJ LT '20160101'.
    MESSAGE 'PLEASE ENTER JOINING BEFORE 2016' TYPE 'E'.
  ENDIF.
ENDFORM.
