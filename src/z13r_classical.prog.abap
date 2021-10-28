*&---------------------------------------------------------------------*
*& Report Z13R_CLASSICAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z13R_CLASSICAL.

TABLES : mara, makt.

TYPES: BEGIN OF lt_mara,
         matnr TYPE mara-matnr,
         ersda TYPE mara-ersda,
         ernam TYPE mara-ernam,
         mtart TYPE mara-mtart,
         mbrsh TYPE mara-mbrsh,
         maktx TYPE makt-maktx,
       END OF lt_mara.


DATA : it_mara TYPE TABLE OF lt_mara,
      wa_mara TYPE lt_mara.

SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE TEXT-001.

SELECT-OPTIONS: S_MATNR FOR MARA-MATNR. " Material range input
PARAMETERS: P_MTART TYPE MARA-MTART. "material type input

SELECTION-SCREEN END OF BLOCK B1.


"Fetching Data
SELECT mara~matnr
         mara~ersda
         mara~ernam
         mara~mtart
         mara~mbrsh
         makt~maktx
    INTO CORRESPONDING FIELDS OF TABLE it_mara
    FROM mara INNER JOIN makt ON ( mara~matnr = makt~matnr ) WHERE mara~matnr IN s_matnr AND mara~mtart = p_mtart.

IF sy-subrc EQ 0.
  LOOP AT it_mara INTO wa_mara.
    WRITE: wa_mara-matnr,
    wa_mara-ersda,wa_mara-ernam,wa_mara-mtart,wa_mara-mbrsh,wa_mara-maktx.
    nEW-LINE.

  ENDLOOP.
ELSE.
  MESSAGE 'Invalid data' TYPE 'E'.
ENDIF.
