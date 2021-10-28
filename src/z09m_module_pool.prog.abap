*&---------------------------------------------------------------------*
*& Modulpool Z09M_MODULE_POOL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM Z09M_MODULE_POOL.
TABLES:MARA.
*&---------------------------------------------------------------------*
*& Module STATUS_9001 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9001 OUTPUT.
SET PF-STATUS 'PFSTATUS_Z09'.
SET TITLEBAR 'Z09_TITLE'.
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

INCLUDE z09m_module_pool_exit_screei01.
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
