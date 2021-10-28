*&---------------------------------------------------------------------*
*& Report Z12R_LIST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z12r_list.

TABLES: mara,makt.

SELECT-OPTIONS: s_matnr FOR mara-matnr OBLIGATORY.
PARAMETERS: p_mtart TYPE mtart OBLIGATORY.



TYPES: BEGIN OF l_ty_mara,
         matnr TYPE matnr,
         ersda TYPE ersda,
         ernam TYPE ernam,
         mtart TYPE mtart,
         mbrsh TYPE mbrsh,
         maktx TYPE maktx,
       END OF l_ty_mara.



DATA: lt_mara TYPE TABLE OF l_ty_mara,
      ls_mara TYPE l_ty_mara.


START-OF-SELECTION.



"display info from mara table and display it in classical report

  SELECT mara~matnr
         mara~ersda
         mara~ernam
         mara~mtart
         mara~mbrsh
         makt~maktx
    INTO CORRESPONDING FIELDS OF TABLE lt_mara
    FROM mara INNER JOIN makt ON ( mara~matnr = makt~matnr ) WHERE mara~matnr IN s_matnr AND mara~mtart = p_mtart.

ENHANCEMENT-POINT Z12E_ENHCPOINT SPOTS Z12E_ESPOT_IMPL .



END-OF-SELECTION.
  IF sy-subrc = 0.

    LOOP AT lt_mara INTO ls_mara.

      WRITE:/ ls_mara-matnr, ls_mara-ersda, ls_mara-ernam, ls_mara-mtart, ls_mara-mbrsh, ls_mara-maktx.

    ENDLOOP.

  ENDIF.
