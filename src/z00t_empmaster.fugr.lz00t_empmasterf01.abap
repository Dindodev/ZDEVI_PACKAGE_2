*----------------------------------------------------------------------*
***INCLUDE LZ00T_EMPMASTERF01.
*----------------------------------------------------------------------*

FORM zevent_doj.

  IF z00t_empmaster-empdoj LT 20160101.
    MESSAGE 'Please Enter DOJ before 20160101' TYPE 'E'.
  ENDIF.



ENDFORM.
