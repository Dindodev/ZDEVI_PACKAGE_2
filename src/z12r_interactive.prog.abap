*&---------------------------------------------------------------------*
*& Report Z12R_INTERACTIVE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z12r_interactive.


TABLES: vbak, vbap.

PARAMETERS: p_so TYPE vbak-vbeln OBLIGATORY.
SELECT-OPTIONS: s_sd FOR vbak-auart OBLIGATORY.



TYPES: BEGIN OF l_ty_vbak,
         auart TYPE auart,
         vbeln TYPE vbeln_va,
         ernam TYPE ernam,
         netwr TYPE netwr_ak,
       END OF l_ty_vbak.

DATA: lt_vbak TYPE TABLE OF l_ty_vbak,
      ls_vbak TYPE l_ty_vbak.

TYPES: BEGIN OF l_ty_vbap,
         posnr TYPE posnr_va,
         matnr TYPE matnr,
         zmeng TYPE dzmeng,
       END OF l_ty_vbap.

DATA: lt_vbap TYPE TABLE OF l_ty_vbap,
      ls_vbap TYPE l_ty_vbap.



"display sales header data and on double click display sales item data

SELECT auart
       vbeln
       ernam
       netwr FROM vbak INTO TABLE lt_vbak WHERE vbeln = p_so AND auart IN s_sd.

IF sy-subrc = 0.

  LOOP AT lt_vbak INTO ls_vbak.

    WRITE:/ ls_vbak-auart, ls_vbak-vbeln HOTSPOT, ls_vbak-ernam, ls_vbak-netwr.
    HIDE: ls_vbak-vbeln.

  ENDLOOP.

ENDIF.



AT LINE-SELECTION.

  CASE sy-lsind.
    WHEN 1.

      SELECT posnr
     matnr
     zmeng FROM vbap INTO TABLE lt_vbap WHERE vbeln = ls_vbak-vbeln.

      IF sy-subrc = 0.
        LOOP AT lt_vbap INTO ls_vbap.
          WRITE:/ ls_vbak-vbeln , ls_vbap-posnr, ls_vbap-matnr, ls_vbap-zmeng.
        ENDLOOP.
      ENDIF.

    WHEN OTHERS.
  ENDCASE.
