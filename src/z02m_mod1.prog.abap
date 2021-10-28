*&---------------------------------------------------------------------*
*& Modulpool Z02M_MOD1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM Z02M_MOD1.

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
*& Module STATUS_9001 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9001 OUTPUT.
 SET PF-STATUS 'Z02_STATUS'.
SET TITLEBAR 'Z02_TITLE'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  VALIDATE_INPUT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validate_input INPUT.
  TABLES : MARA.
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
