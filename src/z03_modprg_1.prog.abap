*&---------------------------------------------------------------------*
*& Module Pool      Z03_MODPRG_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

INCLUDE z03_include_top                         .    " Global Data

* INCLUDE Z03_INCLUDE_O01                         .  " PBO-Modules
* INCLUDE Z03_INCLUDE_I01                         .  " PAI-Modules
* INCLUDE Z03_INCLUDE_F01                         .  " FORM-Routines

*&---------------------------------------------------------------------*
*& Module STATUS_9001 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9001 OUTPUT.
  SET PF-STATUS 'PFSTATUS_Z03'.
  SET TITLEBAR 'TITLE_Z03_A1'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT_SCREEN  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_screen INPUT.
  LEAVE PROGRAM.
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

  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  VALIDATION_MATERIAL  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validation_material INPUT.
  CASE sy-ucomm.

    WHEN 'ENTER'.
      DATA : lv_matnr TYPE mara-matnr.

      SELECT SINGLE matnr FROM mara  INTO lv_matnr WHERE matnr = mara-matnr.
      IF sy-subrc <> 0.
        MESSAGE 'Enter a valid value.' TYPE 'E'.
      ELSE.
        MESSAGE 'Correct Material Entered' TYPE 'S'.
      ENDIF.
      ENDCASE.
ENDMODULE.
