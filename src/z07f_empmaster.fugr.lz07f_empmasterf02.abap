*----------------------------------------------------------------------*
***INCLUDE LZ07F_EMPMASTERF02.
*----------------------------------------------------------------------*
Form z07f_befsaveexp. "Create_EntryZ07Exp.

if Z07D_EMPTABLE-experience > 15. "gt 15.
  Message 'Experience should not be greater than 15' type 'E'.
  endif.

  endform.
