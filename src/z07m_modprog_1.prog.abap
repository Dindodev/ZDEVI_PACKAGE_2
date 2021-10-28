*&---------------------------------------------------------------------*
*& Module Pool      Z07M_MODPROG_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

INCLUDE Z07_INCLUDE3_TOP                        .    " Global Data

* INCLUDE Z07_INCLUDE3_O01                        .  " PBO-Modules
* INCLUDE Z07_INCLUDE3_I01                        .  " PAI-Modules
* INCLUDE Z07_INCLUDE3_F01                        .  " FORM-Routines

*&---------------------------------------------------------------------*
*& Module STATUS_9000 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9000 OUTPUT.
 SET PF-STATUS 'PFSTATUS_Z07'.
  SET TITLEBAR 'TITLE_Z07_A1'.
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
*&---------------------------------------------------------------------*
*&      Module  EXIT_SCREEN  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_screen INPUT.
 LEAVE PROGRAM.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9000 INPUT.
CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE PROGRAM.
    WHEN 'CANCEL'.
      LEAVE PROGRAM.

  ENDCASE.
ENDMODULE.
