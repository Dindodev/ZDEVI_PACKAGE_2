*&---------------------------------------------------------------------*
*& Report Z05R_MATR_DET
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z05R_MATR_DET.


TABLES: mara,makt.


TYPES: BEGIN OF ty_mara,
          matnr type matnr,
          ersda type ersda,
          ernam type ernam,
          mtart type mtart,
          mbrsh type mbrsh,
          maktx TYPE maktx,
       END OF ty_mara.

DATA: wa_mara TYPE ty_mara,
      it_mara TYPE TABLE OF ty_mara.

SELECT-OPTIONS: s_matnr FOR mara-matnr.
PARAMETERS : p_mtart TYPE mara-mtart.

START-OF-SELECTION.


 SELECT mara~matnr mara~ersda mara~ernam mara~mtart mara~mbrsh makt~maktx
      FROM mara INNER JOIN makt ON ( mara~matnr = makt~matnr )
      INTO   CORRESPONDING FIELDS OF  TABLE it_mara
      WHERE mara~matnr BETWEEN s_matnr-low and s_matnr-high AND mara~mtart EQ p_mtart.

 WRITE:/1  'Material No.',
             20 'Created On',
             40 'Name of Person',
             60 'Material Type',
             80 'Industry Sector',
             100 'Mat. Desc.'.
  LOOP AT it_mara INTO wa_mara.
      WRITE:/1  wa_mara-matnr,
             20 wa_mara-ersda,
             40 wa_mara-ernam,
             60 wa_mara-mtart,
             80 wa_mara-mbrsh,
             100 wa_mara-maktx.
  ENDLOOP.
