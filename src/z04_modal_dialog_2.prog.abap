*&---------------------------------------------------------------------*
*& Report Z04_MODAL_DIALOG_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z04_MODAL_DIALOG_2.
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


MODULE status_9001 OUTPUT.
  SET PF-STATUS 'PF_Z04_A2'.
  SET TITLEBAR 'TITLE_A2'.
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
