*&---------------------------------------------------------------------*
*& Report Z04IR_INTERACTIVE_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04ir_interactive_report.
TABLES : vbak,vbap.

SELECT-OPTIONS : s_order FOR vbak-vbeln.
PARAMETERS : p_doc TYPE vbak-auart.

TYPES : BEGIN OF ty_header,
          lv_doc    TYPE vbak-auart,
          lv_dtype  TYPE vbak-vbeln,
          lv_pname  TYPE vbak-ernam,
          lv_sorder TYPE vbak-netwr,

        END OF ty_header.

TYPES : BEGIN OF ty_line,

          lv_dmtype TYPE vbap-vbeln,
          lv_posnr  TYPE vbap-posnr,
          lv_mat    TYPE vbap-matnr,
          lv_zmeng  TYPE vbap-zmeng,

        END OF ty_line.

DATA : it_header TYPE TABLE OF ty_header,
       lw_header TYPE ty_header.

DATA : it_line TYPE TABLE OF ty_line,
       lw_line TYPE ty_line.


START-OF-SELECTION.


  SELECT auart vbeln ernam netwr FROM vbak INTO TABLE it_header WHERE vbeln IN s_order AND auart EQ p_doc.




  LOOP AT it_header INTO lw_header.
    WRITE lw_header-lv_doc.
    WRITE lw_header-lv_dtype.
    WRITE lw_header-lv_pname.
    WRITE lw_header-lv_sorder.
    HIDE lw_header-lv_sorder.
  ENDLOOP.


AT LINE-SELECTION.

  SELECT vbeln posnr matnr zmeng FROM vbap INTO TABLE it_line WHERE vbeln EQ lw_header-lv_dtype.

  LOOP AT it_line INTO lw_line.
    WRITE lw_line-lv_dmtype.
    WRITE lw_line-lv_posnr.
    WRITE lw_line-lv_mat.
    WRITE lw_line-lv_zmeng.

  ENDLOOP.
