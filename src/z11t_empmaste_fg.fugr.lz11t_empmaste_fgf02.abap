*----------------------------------------------------------------------*
***INCLUDE LZ11T_EMPMASTE_FGF02.
*----------------------------------------------------------------------*
form Z11_EVENT_DOJ.
  if Z11T_EMP_TBL-EXPERIENCE gt 15.
    MESSAGE 'Experiance Greater than  15 years are not accepted.' type 'E'.
  endif.

  endform.
