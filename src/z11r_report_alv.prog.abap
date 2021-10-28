*&---------------------------------------------------------------------*
*& Report Z11R_REPORT_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z11r_report_alv.

TABLES: mara ,marc, mard,makt.

TYPES: BEGIN OF ty_matril,
         matnr TYPE mara-matnr,
         werks TYPE marc-werks,
         lgort TYPE mard-lgort,
         mtart TYPE mara-mtart,
         ersda TYPE mara-ersda,
         ernam TYPE mara-ernam,
         xchar TYPE marc-xchar,
         maktx TYPE makt-maktx,
       END OF ty_matril.

DATA : lt_matrl TYPE TABLE OF ty_matril,
       ls_matrl TYPE ty_matril.

DATA: i_filedcat TYPE slis_t_fieldcat_alv WITH HEADER LINE.

SELECT-OPTIONS : s_matid FOR mara-matnr OBLIGATORY.
PARAMETERS : p_mattyp TYPE mara-mtart OBLIGATORY.

START-OF-SELECTION.

  SELECT mara~matnr marc~werks mard~lgort mara~mtart
         mara~ersda mara~ernam marc~xchar makt~maktx
    INTO CORRESPONDING FIELDS OF TABLE lt_matrl
   FROM mara INNER JOIN marc ON ( mara~matnr = marc~matnr )
             INNER JOIN mard ON ( mara~matnr = mard~matnr )
             INNER JOIN makt ON ( mara~matnr = makt~matnr )
   WHERE mara~matnr IN s_matid AND mara~mtart = p_mattyp.

  i_filedcat-col_pos = 1.
  i_filedcat-fieldname = 'Matnr'.
  i_filedcat-tabname = 'lt_matrl'.
  i_filedcat-ref_fieldname ='MATNR'.
  i_filedcat-ref_tabname = 'mara'.
  i_filedcat-key = 'X'.
  i_filedcat-seltext_m = 'MATERIAL NUMBER'.
  i_filedcat-outputlen = 20.
  APPEND i_filedcat TO i_filedcat.
  CLEAR i_filedcat.

  i_filedcat-col_pos = 2.
  i_filedcat-fieldname = 'WERKS'.
  i_filedcat-tabname = 'lt_matrl'.
  i_filedcat-ref_fieldname ='WERKS'.
  i_filedcat-ref_tabname = 'MARC'.
  i_filedcat-key = ''.
  i_filedcat-seltext_m = 'PLANT'.
  i_filedcat-outputlen = 20.
  APPEND i_filedcat TO i_filedcat.
  CLEAR i_filedcat.

  i_filedcat-col_pos = 3.
  i_filedcat-fieldname = 'LGORT'.
  i_filedcat-tabname = 'lt_matrl'.
  i_filedcat-ref_fieldname ='LGORT'.
  i_filedcat-ref_tabname = 'MARD'.
  i_filedcat-key = ''.
  i_filedcat-seltext_m = 'Storage Location'.
  i_filedcat-outputlen = 20.
  APPEND i_filedcat TO i_filedcat.
  CLEAR i_filedcat.

  i_filedcat-col_pos = 4.
  i_filedcat-fieldname = 'MTART'.
  i_filedcat-tabname = 'lt_matrl'.
  i_filedcat-ref_fieldname ='MTART'.
  i_filedcat-ref_tabname = 'mara'.
  i_filedcat-key = ''.
  i_filedcat-seltext_m = 'MATERIAL NUMBER'.
  i_filedcat-outputlen = 20.
  APPEND i_filedcat TO i_filedcat.
  CLEAR i_filedcat.

  i_filedcat-col_pos = 5.
  i_filedcat-fieldname = 'ERSDA'.
  i_filedcat-tabname = 'lt_matrl'.
  i_filedcat-ref_fieldname ='ERSDA'.
  i_filedcat-ref_tabname = 'mara'.
  i_filedcat-key = ''.
  i_filedcat-seltext_m = 'Created ON'.
  i_filedcat-outputlen = 20.
  APPEND i_filedcat TO i_filedcat.
  CLEAR i_filedcat.

  i_filedcat-col_pos = 6.
  i_filedcat-fieldname = 'ERNAM'.
  i_filedcat-tabname = 'lt_matrl'.
  i_filedcat-ref_fieldname ='ERNAM'.
  i_filedcat-ref_tabname = 'mara'.
  i_filedcat-key = ''.
  i_filedcat-seltext_m = 'Created by'.
  i_filedcat-outputlen = 20.
  APPEND i_filedcat TO i_filedcat.
  CLEAR i_filedcat.

  i_filedcat-col_pos = 7.
  i_filedcat-fieldname = 'XCHAR'.
  i_filedcat-tabname = 'lt_matrl'.
  i_filedcat-ref_fieldname ='XCHAR'.
  i_filedcat-ref_tabname = 'mara'.
  i_filedcat-key = ''.
  i_filedcat-seltext_m = 'Created'.
  i_filedcat-outputlen = 20.
  APPEND i_filedcat TO i_filedcat.
  CLEAR i_filedcat.

  i_filedcat-col_pos = 8.
  i_filedcat-fieldname = 'MAKTX'.
  i_filedcat-tabname = 'lt_matrl'.
  i_filedcat-ref_fieldname ='MAKTX'.
  i_filedcat-ref_tabname = 'makt'.
  i_filedcat-key = ''.
  i_filedcat-emphasize = 'C510'.
  i_filedcat-seltext_m = 'MATERIAL DISC'.
  i_filedcat-outputlen = 20.
  APPEND i_filedcat TO i_filedcat.
  CLEAR i_filedcat.

  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_program_name     = sy-cprog
      i_internal_tabname = 'lt_matrl'
      i_inclname         = sy-cprog
    CHANGING
      ct_fieldcat        = i_filedcat[].

  PERFORM header_data.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program      = sy-cprog
      i_callback_top_of_page = 'header_data'
      IT_FIELDCAT              = i_filedcat[]
    TABLES
      t_outtab                = lt_matrl.
*&---------------------------------------------------------------------*
*& Form HEADER_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM header_data .

  DATA: ls_header TYPE slis_listheader,
        lt_header TYPE slis_t_listheader.

  CLEAR ls_header.
  ls_header-typ = 'H'.
  ls_header-info = 'Material Detail Report'.
  APPEND ls_header TO lt_header.
  CLEAR ls_header.

  ls_header-typ = 'S'.

  ls_header-key = 'Report : '.
  ls_header-info = sy-repid.
  APPEND ls_header TO lt_header.


  ls_header-key = 'User Name : '.
  ls_header-info = sy-uname.
  APPEND ls_header TO lt_header.


  ls_header-key = 'Date : '.
  ls_header-info = sy-datum.
  APPEND ls_header TO lt_header.


  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = lt_header.

ENDFORM.
