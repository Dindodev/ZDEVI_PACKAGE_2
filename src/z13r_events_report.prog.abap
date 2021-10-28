*&---------------------------------------------------------------------*
*& Report Z13R_EVENTS_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z13r_events_report.


TABLES: vbak.

TYPES:BEGIN OF l_ty_vbak,
        vbeln TYPE vbeln_va,
        erdat TYPE erdat,
        auart TYPE auart,
      END OF l_ty_vbak.

DATA: lt_vbak TYPE TABLE OF l_ty_vbak.
DATA: ls_vbak TYPE l_ty_vbak.


TYPES:BEGIN OF l_ty_vbap,
        vbeln TYPE vbeln_va,
        posnr TYPE posnr_va,
        matnr TYPE matnr,
        matkl TYPE matkl,
      END OF l_ty_vbap.

DATA: lt_vbap TYPE TABLE OF l_ty_vbap.
DATA: ls_vbap TYPE l_ty_vbap.



START-OF-SELECTION.


  SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.

  SELECT-OPTIONS s_sales FOR vbak-vbeln.

  SELECTION-SCREEN END OF BLOCK b1.


  IF s_sales IS INITIAL.
    MESSAGE 'Please enter sales order number' TYPE 'E'.
  ELSE.
    SELECT vbeln erdat auart FROM vbak INTO TABLE lt_vbak WHERE vbeln IN s_sales.

    IF sy-subrc EQ 0.
      LOOP AT lt_vbak INTO ls_vbak.
        WRITE:/ ls_vbak-vbeln, ls_vbak-erdat, ls_vbak-auart.
        HIDE: ls_vbak-vbeln.
      ENDLOOP.

    ENDIF.

  ENDIF.






AT LINE-SELECTION.


  SELECT vbeln posnr matnr matkl FROM vbap INTO TABLE lt_vbap WHERE vbeln = ls_vbak-vbeln."lv_vbeln.
  IF sy-subrc = 0.
    LOOP AT lt_vbap INTO ls_vbap.
      WRITE:/ ls_vbap-vbeln, ls_vbap-posnr, ls_vbap-matnr, ls_vbap-matkl.
    ENDLOOP.

  ENDIF.
