*&---------------------------------------------------------------------*
*& Report Z07R_SALES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z07r_sales.

TABLES : vbak,vbap.
SELECT-OPTIONS :  sales FOR vbak-vbeln  OBLIGATORY.



TYPES: BEGIN OF ty_struct,
         lv_beln  TYPE vbak-vbeln,
         lv_erdat TYPE vbak-erdat,
         lv_auart TYPE vbak-auart,

       END OF ty_struct.

TYPES: BEGIN OF vbap_struct,
         lv_vbeln1 TYPE vbap-vbeln,
         lv_posnr  TYPE vbap-posnr,
         lv_matnr  TYPE vbap-matnr,
         lv_matkl  TYPE vbap-matkl,

       END OF vbap_struct.

DATA : it_struct TYPE  TABLE OF ty_struct.
DATA : wa_vbak TYPE  ty_struct.
DATA: it_vbap TYPE TABLE OF vbap_struct.
DATA: wa_vbap TYPE vbap_struct.

START-OF-SELECTION.

  SELECT vbeln erdat auart FROM vbak INTO TABLE it_struct WHERE vbeln IN sales.

  IF sy-subrc EQ 0.
    LOOP AT it_struct INTO wa_vbak.


      WRITE wa_vbak-lv_beln.
      WRITE wa_vbak-lv_erdat.
      WRITE wa_vbak-lv_auart.
      HIDE : sales.
      NEW-LINE.


    ENDLOOP.

  ELSE.
    MESSAGE 'Invalid Sales order' TYPE 'E'.
  ENDIF.

AT LINE-SELECTION.

  SELECT vbeln posnr matnr matkl  FROM vbap INTO TABLE it_vbap WHERE vbeln IN sales.
  IF sy-subrc EQ 0.
    LOOP AT it_vbap INTO wa_vbap.
      WRITE wa_vbap-lv_vbeln1.
      WRITE wa_vbap-lv_posnr.
      WRITE wa_vbap-lv_matnr.
      WRITE wa_vbap-lv_matkl.

      NEW-LINE.
    ENDLOOP.
  ELSE.
    MESSAGE 'No Data' TYPE 'E'.
  ENDIF.
