*&---------------------------------------------------------------------*
*& Report Z09P_CLASSICAL_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09p_classical_report.


TABLES: mara, makt.

SELECT-OPTIONS: matno FOR mara-matnr.

PARAMETERS: p_mat_tp(10) TYPE c.

TYPES: BEGIN OF ty_local,
       materialno TYPE mara-matnr,
       createdon TYPE mara-ersda,
       nameofperson TYPE mara-ernam,
       materialtype TYPE mara-mtart,
       industrysector TYPE mara-mbrsh,
       materialdes TYPE makt-maktx,
       END OF ty_local.

DATA: l_table TYPE TABLE OF ty_local,
      wa_local TYPE ty_local.

START-OF-SELECTION.

SELECT mara~matnr mara~ersda mara~ernam mara~mtart mara~mbrsh makt~MAKTX INTO TABLE l_table FROM MARA INNER JOIN MAKT ON ( MARA~MATNR = MAKT~MATNR ) WHERE  mtart = p_mat_tp AND makt~matnr IN MatNo.

  loop at l_table into wa_local .
    write:/ wa_local-materialno, wa_local-createdon, wa_local-nameofperson, wa_local-materialtype.
  ENDLOOP.
