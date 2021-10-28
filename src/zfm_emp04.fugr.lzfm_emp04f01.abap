*----------------------------------------------------------------------*
***INCLUDE LZFM_EMP04F01.
*----------------------------------------------------------------------*
form ZForm.
  if Z004_EMPTABLE-EXPERIENCE gt 15.
    MESSAGE 'Wrong entry' TYPE 'I'.
    endif.
    endform.
