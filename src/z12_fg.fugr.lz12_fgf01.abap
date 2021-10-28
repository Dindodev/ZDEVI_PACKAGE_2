*----------------------------------------------------------------------*
***INCLUDE LZ12_FGF01.
*----------------------------------------------------------------------*
form exp_valid.
*  READ TABLE total  INDEX 1.
*
*  if total-expERIENCE gt '15'.
*    MESSAGE 'Wrong Entry' TYPE 'E'.
*   endif.
  ENDFORM.
