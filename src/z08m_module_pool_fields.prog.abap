*&---------------------------------------------------------------------*
*& Modulpool Z08M_MODULE_POOL_FIELDS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM Z08M_MODULE_POOL_FIELDS.
data : okcode type syucomm.

INCLUDE z08m_module_pool_fields_usei01.
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
*& Module Validate_input OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  Validate_input  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validate_input INPUT.
  TABLES : MARA.
  CASE sy-ucomm.

    WHEN 'ENTER'.
*      DATA : lv_matnr TYPE mara-matnr.
*
*      SELECT SINGLE matnr FROM mara  INTO lv_matnr WHERE matnr = mara-matnr.
*      IF sy-subrc <> 0.
*        MESSAGE 'Enter a valid value.' TYPE 'E'.
*      ELSE.
*        MESSAGE 'Correct Material Entered' TYPE 'S'.
*      ENDIF.


      "DATA: "progname TYPE sy-repid,
       "dynnum TYPE sy-dynnr,
       "it_doc1 TYPE TABLE OF mara,
       "lv_bukrs TYPE bukrs VALUE '1710'.

*   data: begin of dynpfields occurs 3.
*     include structure dynpread.
*       data: end of dynpfields.


  progname = sy-repid.
dynnum = sy-dynnr.
*CLEAR: field_value, dynpro_values.
*field_value-fieldname = 'TXT_CODCO'.
*APPEND field_value TO dynpro_values.



*CALL FUNCTION 'F4IF_FIELD_VALUE_REQUEST'
*EXPORTING
*tabname = 'bkpf'
*fieldname = 'bukrs'
*dynpprog = progname
*dynpnr = dynnum
*dynprofield = 'matnr'.


SELECT *
FROM tka03
INTO CORRESPONDING FIELDS OF TABLE it_doc1.
*WHERE BUKRS = '1710'.



CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
EXPORTING
retfield = 'BELNR'
dynpprog = progname
dynpnr = dynnum
dynprofield = 'TXT_BELNR'
value_org = 'S'
TABLES
value_tab = it_doc1.
      ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_9001 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9001 OUTPUT.
 SET PF-STATUS 'Z08_STATUS'.
SET TITLEBAR 'Z08_MAIN'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT_SCREEN  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_screen INPUT.
LEAVE PROGRAM.
ENDMODULE.
