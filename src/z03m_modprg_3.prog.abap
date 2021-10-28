*&---------------------------------------------------------------------*
*& Module Pool      Z03_MODPRG_3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

INCLUDE Z03_INCLUDE_31_TOP.
*INCLUDE z03_include_3_top                       .    " Global Data

* INCLUDE Z03_INCLUDE_3_O01                       .  " PBO-Modules
* INCLUDE Z03_INCLUDE_3_I01                       .  " PAI-Modules
* INCLUDE Z03_INCLUDE_3_F01                       .  " FORM-Routines

*&---------------------------------------------------------------------*
*& Module STATUS_9000 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9000 OUTPUT.
  SET PF-STATUS 'PF_STATUS_A3'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9000 INPUT.
  CASE sy-ucomm.
    WHEN 'DISP'.
      DATA : lv_vbeln TYPE vbak-vbeln.
      SELECT SINGLE vbeln FROM vbak INTO lv_vbeln WHERE vbeln = vbak-vbeln.
      IF sy-subrc <> 0.
        MESSAGE 'Enter a valid value.' TYPE 'E'.
      ELSE.
        SELECT posnr matnr arktx werks kwmeng vrkme FROM vbap INTO TABLE it_sales WHERE vbeln = vbak-vbeln.
        IF sy-subrc <> 0.
          MESSAGE 'DATA COULD NOT BE FETCHED FOR THIS SALES ORDER NO' TYPE 'E'.
        ELSE.

        ENDIF.
      ENDIF.
    WHEN 'BACK'.
      LEAVE PROGRAM.
    WHEN 'CANCEL'.
      LEAVE PROGRAM.
  ENDCASE.
ENDMODULE.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TC_SALES' ITSELF
CONTROLS: TC_SALES TYPE TABLEVIEW USING SCREEN 9000.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC_SALES'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE TC_SALES_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE IT_SALES LINES TC_SALES-lines.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  VALIDATION_MATERIAL  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validation_material INPUT.
CASE sy-ucomm.

    WHEN 'DISP'.
*      DATA : lv_vbeln TYPE vbak-vbeln.

      SELECT SINGLE vbeln FROM vbak  INTO lv_vbeln WHERE vbeln = vbak-vbeln.
      IF sy-subrc <> 0.
        MESSAGE 'Enter a valid value.' TYPE 'E'.
      ELSE.
        MESSAGE 'Correct Material Entered' TYPE 'S'.
      ENDIF.
      ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  MODIFY_ITAB  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE modify_itab INPUT.

*  it_sales-posnr = lv_vbeln-posnr.
*  it_sales-matnr = lv_vbeln-matnr.
*  it_sales-arktx = lv_vbeln-arktx.
*  it_sales-werks = lv_vbeln-werks.
*  it_sales-kwmeng = lv_vbeln-kwmeng.
*  it_sales-vrkme = lv_vbeln-vrkme.

*  MODIFY it_sales INDEX tc_9000-current_line.
*  IF sy-subrc <> 0.
*    INSERT it_sales INDEX tc_9000-current_line.
*  ENDIF.
ENDMODULE.
