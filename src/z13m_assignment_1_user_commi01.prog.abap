*----------------------------------------------------------------------*
***INCLUDE Z13M_ASSIGNMENT_1_USER_COMMI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9000 INPUT.
CASE SY-UCOMM.
  WHEN 'BACK'.
    LEAVE PROGRAM.
    ENDCASE.


ENDMODULE.
