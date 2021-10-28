*----------------------------------------------------------------------*
***INCLUDE LZ01T_EMPMASTER1F01.
*----------------------------------------------------------------------*

form valid_exp.

IF z01t_empmaster1-EMPEXP gt '15'.

  MESSAGE 'Enter less experience' TYPE 'E'.

ENDIF.

endform.
