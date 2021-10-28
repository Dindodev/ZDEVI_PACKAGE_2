*&---------------------------------------------------------------------*
*& Report Z03R_DAY4_INTREPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03r_day4_intreport.

* Tables we are going to use
TABLES: vbak, vbap.

* Structures/we are going to use
TYPES: BEGIN OF ty_screen1,
         auart TYPE vbak-auart,
         vbeln TYPE vbak-vbeln,
         ernam TYPE vbak-ernam,
         netwr TYPE vbak-netwr,
       END OF ty_screen1,

       BEGIN OF ty_screen2,

         posnr TYPE posnr,
         matnr TYPE matnr,
         zmeng TYPE vbap-zmeng,
       END OF ty_screen2.


* Data decalarton
DATA: wa_screen1 TYPE ty_screen1,
      it_screen1 TYPE TABLE OF ty_screen1,
      wa_screen2 TYPE ty_screen2,
      it_screen2 TYPE TABLE OF ty_screen2.

* screen
* screen input
PARAMETERS : p_vbeln TYPE vbak-vbeln OBLIGATORY.
SELECT-OPTIONS: s_auart FOR vbak-auart OBLIGATORY.

TOP-OF-PAGE.
  WRITE:/1 'Primary Screen'.


* Writing the header data for the table screen 1
  WRITE:/1 'Sales Document type',
         30 'Sales Document',
            60 'Name of Person',
            90 'Net value of Sales order'.
*Start of selection Event
START-OF-SELECTION.
  SELECT auart vbeln ernam netwr
      FROM vbak
      INTO TABLE it_screen1
      WHERE auart IN s_auart AND vbeln = p_vbeln.

  IF sy-subrc NE 0.
    MESSAGE 'Data could not be fetched from the table.' TYPE 'E'.
  ELSE.
    LOOP AT it_screen1 INTO wa_screen1.
      WRITE:/1  wa_screen1-auart,
             30 wa_screen1-vbeln  HOTSPOT,
             60 wa_screen1-ernam,
             90 wa_screen1-netwr.
      HIDE wa_screen1-vbeln.
    ENDLOOP.
  ENDIF.

*TOP of selection on line selection
TOP-OF-PAGE DURING LINE-SELECTION.
  WRITE : / 'Secondary Screen'.


* Writing the header data for the table screen2
  WRITE:/10 'Sales Document',
         30 'Sales Document Itme',
            60 'Material Number',
            90 'Target Quantity'.
* line selection fetching data on click of first screen line item
AT LINE-SELECTION.
  CASE sy-lsind.
    WHEN 1.
      SELECT posnr matnr zmeng
          FROM vbap
          INTO TABLE it_screen2
          WHERE vbeln = wa_screen1-vbeln.

      IF sy-subrc NE 0.
        MESSAGE 'Data could not be fetched from the table.' TYPE 'E'.
      ELSE.
        LOOP AT it_screen2 INTO wa_screen2.
          WRITE:/10   wa_screen1-vbeln,
                 30    wa_screen2-posnr,
                 60    wa_screen2-matnr,
                 90    wa_screen2-zmeng.

        ENDLOOP.
      ENDIF.

    WHEN OTHERS.
      MESSAGE 'Not Correct level screen' TYPE 'e'.
  ENDCASE.
