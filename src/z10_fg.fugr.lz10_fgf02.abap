*----------------------------------------------------------------------*
***INCLUDE LZ10_FGF01.
*----------------------------------------------------------------------*
form z10_event_expe.
  if ZEMP_TBL-EXPERIENCE GT 15.
    MESSAGE 'GREATER THAN 15' TYPE 'E'.
  ENDIF.

  endform.
