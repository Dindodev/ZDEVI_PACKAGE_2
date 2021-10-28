*----------------------------------------------------------------------*
***INCLUDE LZ12_FGF03.
*----------------------------------------------------------------------*
form create_entry.
if Z12_EMP-EXPERIENCE gt 15.
  MESSAGE 'wrong entry' TYPE 'I'.
  endif.
  endform.
