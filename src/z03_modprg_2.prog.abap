*&---------------------------------------------------------------------*
*& Module Pool      Z03_MODPRG_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

INCLUDE z03_include_2_top                       .    " Global Data

* INCLUDE Z03_INCLUDE_2_O01                       .  " PBO-Modules
* INCLUDE Z03_INCLUDE_2_I01                       .  " PAI-Modules
* INCLUDE Z03_INCLUDE_2_F01                       .  " FORM-Routines

*&---------------------------------------------------------------------*
*& Module STATUS_9001 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9001 OUTPUT.
  SET PF-STATUS 'PF_Z03_A2'.
  SET TITLEBAR 'TITLE_A2'.
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
    WHEN 'CANCEL'.
      LEAVE PROGRAM.
    WHEN 'NEXT'.
      CALL SCREEN '9002'.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_9002 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9002 OUTPUT.
 SET PF-STATUS 'PF_STATUS_A2'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9002  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9002 INPUT.
CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE PROGRAM.
    WHEN 'CANCEL'.
      LEAVE PROGRAM.
    WHEN 'PREV'.
      CALL SCREEN '9001'.
  ENDCASE.
ENDMODULE.
