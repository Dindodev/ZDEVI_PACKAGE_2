*&---------------------------------------------------------------------*
*& Report Z13R_INTRACTIVE_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z13R_INTRACTIVE_REPORT.
TABLES: VBAK, VBAP.

TYPES: BEGIN OF lt_vbak,
         auart TYPE auart,
         vbeln TYPE vbeln_va,
         ernam TYPE ernam,
         netwr TYPE netwr_ak,

       END OF lt_vbak.


DATA : it_vbak TYPE TABLE OF lt_vbak,
      wa_vbak TYPE lt_vbak.

TYPES: BEGIN OF lt_vbap,

         posnr TYPE posnr_va,
         matnr TYPE matnr,
         zmeng TYPE dzmeng,

       END OF lt_vbap.


DATA : it_vbap TYPE TABLE OF lt_vbap,
      wa_vbap TYPE lt_vbap.


SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE TEXT-001.

PARAMETERS: P_VBELN TYPE vbak-vbeln.
SELECT-OPTIONS: S_AUART FOR vbak-auart.


SELECTION-SCREEN END OF BLOCK B1.

SELECT auart
       vbeln
       ernam
       netwr FROM vbak INTO TABLE it_vbak WHERE vbeln = P_VBELN AND auart IN s_AUART.


IF sy-subrc = 0.

  LOOP AT it_vbak INTO wa_vbak.

    WRITE:/ wa_vbak-auart, wa_vbak-vbeln HOTSPOT, wa_vbak-ernam, wa_vbak-netwr.
    HIDE: wa_vbak-vbeln.

  ENDLOOP.

ENDIF.


AT LINE-SELECTION.

  CASE sy-lsind.
    WHEN 1.

      SELECT posnr
     matnr
     zmeng FROM vbap INTO TABLE it_vbap WHERE vbeln = wa_vbak-vbeln.

      IF sy-subrc = 0.
        LOOP AT it_vbap INTO wa_vbap.
          WRITE:/ wa_vbak-vbeln , wa_vbap-posnr, wa_vbap-matnr, wa_vbap-zmeng.
        ENDLOOP.
      ENDIF.

    WHEN OTHERS.
  ENDCASE.
