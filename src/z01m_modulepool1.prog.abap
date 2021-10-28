*&---------------------------------------------------------------------*
*& Modulpool Z01M_MODULEPOOL1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

PROGRAM z01m_modulepool1.
DATA : okcode type syucomm.

*&---------------------------------------------------------------------*
*& Module STATUS_0001 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0001 OUTPUT.
  SET PF-STATUS 'Z01_STATUS'.
  SET TITLEBAR 'Z01_TITLE'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  VALIDATE_MATERIAL  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validate_material INPUT.
  TABLES:MARA.
  CASE sy-ucomm.
    WHEN 'ENTER'.
      DATA lv_matnr TYPE mara-matnr.
      SELECT SINGLE matnr FROM mara INTO lv_matnr WHERE matnr = mara-matnr.
        IF sy-subrc <> 0.
          MESSAGE ' Material Number entered is Invalid ' TYPE 'E' .
        ELSE.
          MESSAGE 'Material Number entered is valid' TYPE 'S' .
        ENDIF.
    ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT_SCREEN  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_screen INPUT.
  LEAVE program.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0001  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0001 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE PROGRAM.
    WHEN 'CANCEL'.
      LEAVE PROGRAM.

  ENDCASE.


ENDMODULE.
