*----------------------------------------------------------------------*
***INCLUDE Z04_MODAL_DIALOG_VALIDATIONI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  VALIDATION_MATERIAL  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
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
MODULE validation_material INPUT.
   CASE sy-ucomm.

    WHEN 'ENTER'.
      Tables : mara.
      DATA : lv_matnr TYPE mara-matnr.

      SELECT SINGLE matnr FROM mara  INTO lv_matnr WHERE matnr = mara-matnr.
      IF sy-subrc is not INITIAL.
        MESSAGE 'Enter a valid value.' TYPE 'E'.
      ELSE.
        MESSAGE 'Correct Material Entered' TYPE 'S'.
      ENDIF.
      ENDCASE.

ENDMODULE.
