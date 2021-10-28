*&---------------------------------------------------------------------*
*& Report Z03R_DAY4_CLASSICALREPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03r_day4_classicalreport.

* Table lists we are going to use.
TABLES: mara,makt.

* Defining the structure, internal table structure
TYPES: BEGIN OF ty_mara,
         matnr TYPE mara-matnr,
         ersda TYPE mara-ersda,
         ernam TYPE mara-ernam,
         mtart TYPE mara-mtart,
         mbrsh TYPE mara-mbrsh,
         maktx TYPE maktx,
       END OF ty_mara.

* Data objects, interbal tables and work areas
DATA: wa_mara TYPE ty_mara,
      it_mara TYPE TABLE OF ty_mara.

* screen input
SELECT-OPTIONS: s_matnr FOR mara-matnr OBLIGATORY.
PARAMETERS : p_mtart TYPE mara-mtart OBLIGATORY.

* Top Of Page
TOP-OF-PAGE.
  WRITE:/1  'Classical Report - Material Data'.
  SKIP 2.


* Writing the header data for the table
  WRITE:/1 'Material Number',
         20 'Created On',
            40 'Name of Person',
            60 'Material Type',
            80 'Industry Type',
            100 'Material Description'.

* Start of selection event
START-OF-SELECTION.
  SELECT mara~matnr mara~ersda mara~ernam mara~mtart mara~mbrsh makt~maktx
      FROM mara INNER JOIN makt ON ( mara~matnr = makt~matnr )
      INTO   CORRESPONDING FIELDS OF  TABLE it_mara
      WHERE mara~matnr IN s_matnr AND mara~mtart = p_mtart.

  IF sy-subrc NE 0.
    MESSAGE 'Data could not be fetched from the table.' TYPE 'E'.
  ELSE.
* printing the values.
    LOOP AT it_mara INTO wa_mara.
      WRITE:/1  wa_mara-matnr,
             20 wa_mara-ersda,
             40 wa_mara-ernam,
             60 wa_mara-mtart,
             80 wa_mara-mbrsh,
             100 wa_mara-maktx.
    ENDLOOP.
  ENDIF.
