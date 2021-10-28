*&---------------------------------------------------------------------*
*& Modulpool Z12M_MODULE_POOL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM z12m_module_pool.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9001  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9001 INPUT.


  CASE sy-ucomm.

    WHEN 'EXIT'.
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
 SET PF-STATUS 'PF_STATUS'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  VALIDATION_MATERIAL  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validation_material INPUT.

  CASE sy-ucomm.

    WHEN 'ENTER'.
      DATA : lv_matnr TYPE MARA-matnr.
*      TABLES: mara.

      SELECT SINGLE matnr FROM mara  INTO lv_matnr WHERE matnr = '1234'. " mara-matnr.
      IF sy-subrc <> 0.
        MESSAGE 'Enter a valid value.' TYPE 'E'.
      ELSE.
        MESSAGE 'Correct Material Entered' TYPE 'S'.
      ENDIF.
      ENDCASE.

ENDMODULE.

INCLUDE Z12_INCLUDE_TOP.
