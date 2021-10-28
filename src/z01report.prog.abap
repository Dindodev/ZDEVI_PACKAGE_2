*&---------------------------------------------------------------------*
*& Report Z01REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01report.


INITIALIZATION.

  TABLES : vbap ,vbak.

  SELECT-OPTIONS : so_slod FOR vbap-vbeln.

  TYPES : BEGIN OF ty_vbak,
            vbeln TYPE vbeln,
            erdat TYPE erdat,
            auart TYPE auart,
          END OF ty_vbak.

  TYPES : BEGIN OF ty_vbap,
            vbeln TYPE vbeln,
            matnr TYPE matnr,
            posnr TYPE posnr,
            matkl TYPE matkl,
          END OF ty_vbap.

  DATA : it_vbak TYPE TABLE OF ty_vbak,
         wa_vbak TYPE ty_vbak,
         it_vbap TYPE TABLE OF ty_vbap,
         wa_vbap TYPE ty_vbap.

START-OF-SELECTION.

  SELECT vbeln erdat auart FROM vbak INTO TABLE it_vbak WHERE vbeln IN so_slod.
  IF sy-subrc <> 0.
    MESSAGE 'data could not be fetched ' TYPE 'E'.
  ELSE.
    LOOP AT it_vbak INTO wa_vbak.
      WRITE :
          wa_vbak-vbeln,
          wa_vbak-erdat,
          wa_vbak-auart.
      uline.
    ENDLOOP.

  ENDIF.

AT SELECTION-SCREEN ON so_slod.
  IF so_slod IS INITIAL.
    MESSAGE 'please enter a sales order no' TYPE 'E'.
  ELSE .
    SELECT vbeln FROM vbak INTO TABLE it_vbak WHERE vbeln  IN so_slod.

    IF sy-subrc <> 0.
      MESSAGE 'Nosuch record exits enter a valid sales order no' TYPE 'e' .

    ENDIF.
  ENDIF.

AT LINE-SELECTION.
  SELECT vbeln matnr posnr matkl FROM vbap INTO TABLE it_vbap WHERE vbeln = wa_vbak-vbeln .

    LOOP AT it_vbap INTO wa_vbap.
      WRITE :
        wa_vbap-vbeln,
        wa_vbap-matnr,
        wa_vbap-posnr,
        wa_vbap-matkl.

    ENDLOOP.
