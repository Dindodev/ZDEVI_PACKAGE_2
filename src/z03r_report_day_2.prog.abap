*&---------------------------------------------------------------------*
*& Report Z03R_REPORT_DAY_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03r_report_day_2.



TYPES : BEGIN OF ls_structure,

          lv_salesdoc     TYPE vbak-vbeln,
          lv_date         TYPE vbak-erdat,
          lv_salesdoctype TYPE vbak-auart,

        END OF ls_structure.

TYPES : BEGIN OF ls_structure_2,

          lv_salesdoc     TYPE vbap-vbeln,
          lv_salesdocitem TYPE vbap-posnr,
          lv_materno      TYPE vbap-matnr,
          lv_mategroup    TYPE vbap-matkl,

        END OF ls_structure_2.

DATA : lt_table   TYPE TABLE OF ls_structure,    "internal table as the structure
       wa_vbak    TYPE ls_structure,            " work area s type of internal table
       lt_table_2 TYPE TABLE OF ls_structure_2,
       wa_table_2 TYPE ls_structure_2.

TABLES: vbak.
SELECT-OPTIONS : lv_sales FOR vbak-vbeln.

TOP-OF-PAGE.
  WRITE 'Sales Document Number'.


START-OF-SELECTION.
  SELECT vbeln erdat auart FROM vbak INTO TABLE lt_table WHERE vbeln IN lv_sales.
  IF sy-subrc NE 0.
    MESSAGE 'Data could not be fetched.' TYPE 'E'.
  ELSE.
    LOOP AT lt_table INTO wa_vbak.
      WRITE: wa_vbak-lv_salesdoc,
             wa_vbak-lv_date,
             wa_vbak-lv_salesdoctype.
      HIDE:  wa_vbak-lv_salesdoc.
      NEW-LINE.
    ENDLOOP.
  ENDIF.
END-OF-SELECTION.

AT SELECTION-SCREEN ON lv_sales.
  IF lv_sales IS INITIAL.
    MESSAGE 'please enter the sales number' TYPE 'E'.
  ELSE.
    SELECT vbeln FROM vbak INTO TABLE lt_table WHERE vbeln IN lv_sales.
    IF sy-subrc NE 0.
      MESSAGE 'no such sales document is found, please enter correct sales number' TYPE 'E'.
    ENDIF.
  ENDIF.


AT LINE-SELECTION.
  SELECT vbeln posnr matnr matkl FROM vbap INTO TABLE lt_table_2 WHERE vbeln = wa_vbak-lv_salesdoc.
  IF sy-subrc NE 0.
    MESSAGE 'data could not be fetched' TYPE 'E'.
  ELSE.
    LOOP AT lt_table_2 INTO wa_table_2.
      WRITE: wa_table_2-lv_salesdoc,
             wa_table_2-lv_salesdocitem,
             wa_table_2-lv_materno,
             wa_table_2-lv_mategroup.
      NEW-LINE.
    ENDLOOP.
  ENDIF.


END-OF-PAGE.
  WRITE 'this is the footer text'.
