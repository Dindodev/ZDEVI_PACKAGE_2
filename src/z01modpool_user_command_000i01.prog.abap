*----------------------------------------------------------------------*
***INCLUDE Z01MODPOOL_USER_COMMAND_000I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0002  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0002 INPUT.
CASE SY-UCOMM.
  WHEN 'EXIT'.
    LEAVE PROGRAM.
    ENDCASE.
ENDMODULE.
