*&---------------------------------------------------------------------*
*& Report Z10R_INTERACTIVE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z10r_interactive.

TABLES: vbak , vbap.

TYPES : BEGIN OF ty_vbak,
auart TYPE auart,
vbeln TYPE vbeln_va,
ernam TYPE ernam,
netwr TYPE netwr_ak,
END OF ty_vbak,

BEGIN OF ty_vbap,
posnr TYPE posnr_va,
matnr TYPE matnr,
zmeng TYPE dzmeng,
END OF ty_vbap.

DATA: lt_vbak TYPE TABLE OF ty_vbak,
      lt_vbap TYPE TABLE OF ty_vbap,
      ls_vbak TYPE ty_vbak,
      ls_vbap TYPE ty_vbap.

PARAMETERS : p_vbeln TYPE vbak-vbeln.

SELECT-OPTIONS : s_auart for vbak-auart.

SELECT vbak~auart vbak~vbeln vbak~ernam vbak~netwr FROM vbak INTO TABLE lt_vbak where vbeln = p_vbeln and auart in s_auart.

  LOOP AT lt_vbak INTO ls_vbak.
      write:/1 ls_vbak-auart,
      20 ls_vbak-vbeln HOTSPOT,
      30 ls_vbak-ernam,
      40 ls_vbak-netwr.
      HIDE ls_vbak-vbeln.
  ENDLOOP.

  AT LINE-SELECTION.

  CASE sy-lsind.
    WHEN 1.
      SELECT posnr matnr zmeng FROM vbap INTO TABLE lt_vbap where vbeln = ls_vbak-vbeln.

  LOOP AT lt_vbap INTO ls_vbap.
      write:/1 ls_vbak-vbeln,
      20 ls_vbap-posnr ,
      30 ls_vbap-matnr,
      40 ls_vbap-zmeng.
  ENDLOOP.
  ENDCASE.
