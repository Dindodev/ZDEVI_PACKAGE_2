*&---------------------------------------------------------------------*
*& Report Z05R_INT_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z05R_INT_1.

TABLES: vbak, vbap.


TYPES: BEGIN OF ty_vbak,
          auart type auart,
          vbeln type vbeln,
          ernam type ernam,
          netwr type netwr,
       END OF ty_vbak,

       BEGIN OF ty_vbap,
          vbeln type vbeln,
          posnr type posnr,
          matnr type matnr,
          zmeng type vbap-zmeng,
       END OF ty_vbap.

DATA: wa_vbak TYPE ty_vbak,
      it_vbak TYPE TABLE OF ty_vbak,
      wa_vbap TYPE ty_vbap,
      it_vbap TYPE TABLE OF ty_vbap.

PARAMETERS : s_vbeln TYPE vbak-vbeln.
SELECT-OPTIONS : s_auart FOR vbak-auart.

START-OF-SELECTION.
  SELECT vbeln auart ernam netwr
      FROM vbak
      INTO TABLE it_vbak
      WHERE auart BETWEEN s_auart-low and s_auart-high AND vbeln EQ s_vbeln.

  LOOP AT it_vbak INTO wa_vbak.
      WRITE:/1  wa_vbak-vbeln HOTSPOT,
             20 wa_vbak-auart,
             40 wa_vbak-ernam,
             60 wa_vbak-netwr.
      HIDE wa_vbak-vbeln.
  ENDLOOP.

  AT LINE-SELECTION.
    SELECT vbeln posnr matnr zmeng from vbap INTO TABLE it_vbap where vbeln EQ wa_vbak-vbeln.
      WRITE:/1 wa_vbak-vbeln.
        LOOP AT it_vbap INTO wa_vbap.
          WRITE:/10    wa_vbap-vbeln ,
                 20    wa_vbap-posnr,
                 30    wa_vbap-matnr,
                 40    wa_vbap-zmeng.
          HIDE wa_vbap-vbeln.
        ENDLOOP.
TOP-OF-PAGE.
    WRITE:/30  'Customer Details Report' COLOR 1.
    SKIP 1.
    ULINE.

TOP-OF-PAGE DURING LINE-SELECTION.
    CASE sy-lsind.
      WHEN 1.
        WRITE:/30 'Customer Details Report - Sales Orders' COLOR 3.
        SKIP.
        ULINE.
    ENDCASE.
