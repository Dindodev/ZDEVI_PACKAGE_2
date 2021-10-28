*&---------------------------------------------------------------------*
*& Modulpool Z08M_MODULE_TABLECONTROL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM Z08M_MODULE_TABLECONTROL.
TABLES : VBAK,VBAP.

TYPES : BEGIN OF ls_structure,
        POSNR TYPE VBAP-POSNR,
        MATNR TYPE VBAP-MATNR,
        ARKTX TYPE VBAP-ARKTX,
        WERKS TYPE VBAP-WERKS,
        KWMENG TYPE VBAP-KWMENG,
        VRKME TYPE VBAP-VRKME,
        END OF ls_structure.

DATA : it_vbap TYPE TABLE OF ls_structure,
       wa_vbap TYPE ls_structure.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TC_SALES' ITSELF
CONTROLS: TC_SALES TYPE TABLEVIEW USING SCREEN 9000.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC_SALES'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE TC_SALES_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE IT_VBAP LINES TC_SALES-lines.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_9000 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9000 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_9000 INPUT.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9000 INPUT.
  CASE sy-ucomm.
    WHEN 'DISPLAY'.
      DATA : lv_vbeln TYPE vbak-vbeln.
      SELECT SINGLE vbeln FROM vbak INTO lv_vbeln WHERE vbeln = vbak-vbeln.
      IF sy-subrc <> 0.
        MESSAGE 'Enter a valid value.' TYPE 'E'.
      ELSE.
        SELECT posnr matnr arktx werks kwmeng vrkme FROM vbap INTO TABLE it_vbap WHERE vbeln = vbak-vbeln.
        ENDIF.
        ENDCASE.

ENDMODULE.
