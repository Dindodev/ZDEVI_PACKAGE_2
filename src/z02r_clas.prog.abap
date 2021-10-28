*&---------------------------------------------------------------------*
*& Report Z02R_CLAS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z02R_CLAS.


TABLES : MARA , makt .

TYPES: BEGIN OF ty_mara,
          matnr type mara-matnr,
          ersda type mara-ersda,
          ernam type mara-ernam,
          mtart type mara-mtart,
          mbrsh type mara-mbrsh,
          Maktx TYPE MAKT-MAKTX,
       END OF ty_mara.

*TYPES: BEGIN OF ty_makt,
*          matnr type maktx,
*       END OF ty_makt.

       DATA : wa_mara TYPE ty_mara,
      it_mara TYPE TABLE OF ty_mara.

       SELECT-OPTIONS: s_matnr FOR mara-matnr.

PARAMETERS : s_mtart TYPE mara-mtart.


START-OF-SELECTION.
  SELECT MARA~matnr mara~ersda mara~ernam mara~mtart mara~mbrsh makt~maktx
      FROM mara INNER JOIN MAKT ON ( MARA~MATNR = MAKT~MATNR )
      INTO TABLE it_mara
      WHERE mtart eq s_mtart and mara~matnr in s_matnr.



loop at : it_mara  INTO wa_mara.
      WRITE:/1  wa_mara-matnr,
             20 wa_mara-ersda,
             40 wa_mara-ernam,
             60 wa_mara-mtart,
             80 wa_mara-mbrsh,
             100 wa_mara-maktx.
  ENDLOOP.


TOP-OF-PAGE.
  WRITE:/1  'First Level of the report'.
  SKIP 5.
