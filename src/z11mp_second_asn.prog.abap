*&---------------------------------------------------------------------*
*& Module Pool      Z11MP_SECOND_ASN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

INCLUDE Z11_INCLUDE2_TOP                        .    " Global Data

* INCLUDE Z11_INCLUDE2_O01                        .  " PBO-Modules
* INCLUDE Z11_INCLUDE2_I01                        .  " PAI-Modules
* INCLUDE Z11_INCLUDE2_F01                        .  " FORM-Routines

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9002  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9002 INPUT.

CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE PROGRAM.
       WHEN 'PREV'.
      CALL SCREEN '9001'.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9001  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9001 INPUT.

  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE PROGRAM.

    WHEN 'NEXT'.
      CALL SCREEN '9002'.
  ENDCASE.

ENDMODULE.
