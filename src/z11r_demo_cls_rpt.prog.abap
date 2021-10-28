*&---------------------------------------------------------------------*
*& Report Z11R_DEMO_CLS_RPT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z11r_demo_cls_rpt.
TABLES: mara,makt.
TYPES: BEGIN OF ty_matnmbr,
         matnr TYPE mara-matnr,
         ersda TYPE mara-ersda,
         ernam TYPE mara-ernam,
         mtart TYPE mara-mtart,
         mbrsh TYPE mara-mbrsh,
         maktx TYPE makt-maktx,
       END OF ty_matnmbr.

DATA: lt_mat TYPE TABLE OF ty_matnmbr,
      ls_mat TYPE ty_matnmbr.

SELECT-OPTIONS s_mtno FOR mara-matnr.
PARAMETERS :p_mattyp TYPE mara-mtart.

START-OF-SELECTION.
  SELECT m~matnr m~ersda m~ernam m~mtart m~mbrsh t~maktx
      INTO CORRESPONDING FIELDS OF TABLE lt_mat
    FROM ( mara AS m
            INNER JOIN makt AS t ON m~matnr = t~matnr )
      WHERE m~matnr IN s_mtno AND m~mtart = p_mattyp.

  LOOP AT  lt_mat INTO  ls_mat.
    WRITE:/1  ls_mat-matnr,
           20 ls_mat-ersda,
           40 ls_mat-ersda,
           60 ls_mat-mtart,
           80 ls_mat-mbrsh,
           100 ls_mat-maktx.
  ENDLOOP.
