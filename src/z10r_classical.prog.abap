*&---------------------------------------------------------------------*
*& Report Z10R_MARA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z10r_classical.

TABLES : mara, makt.

TYPES : BEGIN OF ty_mara,
          matnr TYPE matnr,
          ersda TYPE ersda,
          ernam TYPE ernam,
          mtart TYPE mtart,
          maktx TYPE maktx,
        END OF ty_mara.

DATA : lt_mara TYPE TABLE OF ty_mara,
       ls_mara TYPE ty_mara.

SELECT-OPTIONS : s_matnr FOR mara-matnr.
PARAMETERS : p_mtart TYPE mtart.

START-OF-SELECTION.

  SELECT mara~matnr mara~ersda mara~ernam mara~mtart makt~maktx INTO CORRESPONDING FIELDS OF TABLE lt_mara
    FROM mara INNER JOIN makt on ( mara~matnr = makt~matnr ) WHERE mara~mtart = p_mtart and mara~matnr in s_matnr.

    LOOP AT lt_mara into ls_mara.
          write:/1 ls_mara-matnr,
                 20 ls_mara-ersda,
                 30 ls_mara-ernam,
                 40 ls_mara-mtart.
    ENDLOOP.
