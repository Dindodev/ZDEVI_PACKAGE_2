*&---------------------------------------------------------------------*
*& Report Z06R_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06r_alv.

TABLES: mara.

SELECT-OPTIONS: s_matnr FOR mara-matnr OBLIGATORY.
PARAMETERS: p_mtart TYPE mara-mtart OBLIGATORY.


TYPES: BEGIN OF l_ty_mara,
         matnr TYPE mara-matnr,
         werks TYPE marc-werks,
         lgort TYPE mard-lgort,
         mtart TYPE mara-mtart,
         ersda TYPE mara-ersda,
         ernam TYPE mara-ernam,
         xchar TYPE marc-xchar,
         maktx TYPE makt-maktx,
       END OF l_ty_mara.

DATA: lt_mara TYPE TABLE OF l_ty_mara,
      ls_mara TYPE l_ty_mara.


DATA:i_fieldcat TYPE slis_t_fieldcat_alv WITH HEADER LINE.


START-OF-SELECTION.

  SELECT mara~matnr
    marc~werks
    mard~lgort
    mara~mtart
    mara~ersda
    mara~ernam
    marc~xchar
    makt~maktx
    INTO CORRESPONDING FIELDS OF TABLE lt_mara
    FROM mara INNER JOIN marc ON ( mara~matnr = marc~matnr )
              INNER JOIN mard ON ( mara~matnr = mard~matnr )
              INNER JOIN makt ON ( mara~matnr = makt~matnr )
     WHERE mara~matnr IN s_matnr AND mara~mtart = p_mtart.





  i_fieldcat-col_pos = 1.
  i_fieldcat-fieldname = 'MATNR'.
  i_fieldcat-tabname = 'LT_MARA'.
  i_fieldcat-ref_fieldname = 'MATNR'.
  i_fieldcat-ref_tabname = 'mara'.
  i_fieldcat-key = 'X'.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  i_fieldcat-seltext_m = 'MATERIAL NUMBER'.
  i_fieldcat-outputlen = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.


  i_fieldcat-col_pos = 2.
  i_fieldcat-fieldname = 'WERKS'.
  i_fieldcat-tabname = 'LT_MARA'.
  i_fieldcat-ref_fieldname = 'WERKS'.
  i_fieldcat-ref_tabname = 'MARC'.
  i_fieldcat-key = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  i_fieldcat-seltext_m = 'PLANT'.
  i_fieldcat-outputlen = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.


  i_fieldcat-col_pos = 3.
  i_fieldcat-fieldname = 'LGORT'.
  i_fieldcat-tabname = 'LT_MARA'.
  i_fieldcat-ref_fieldname = 'LGORT'.
  i_fieldcat-ref_tabname = 'MARD'.
  i_fieldcat-key = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  i_fieldcat-seltext_m = 'STORAGE LOCATION'.
  i_fieldcat-outputlen = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.


  i_fieldcat-col_pos = 4.
  i_fieldcat-fieldname = 'MTART'.
  i_fieldcat-tabname = 'LT_MARA'.
  i_fieldcat-ref_fieldname = 'MTART'.
  i_fieldcat-ref_tabname = 'MARA'.
  i_fieldcat-key = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  i_fieldcat-seltext_m = 'Material Type'.
  i_fieldcat-outputlen = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.


  i_fieldcat-col_pos = 5.
  i_fieldcat-fieldname = 'ERSDA'.
  i_fieldcat-tabname = 'LT_MARA'.
  i_fieldcat-ref_fieldname = 'ERSDA'.
  i_fieldcat-ref_tabname = 'MARA'.
  i_fieldcat-key = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  i_fieldcat-seltext_m = 'CREATED ON'.
  i_fieldcat-outputlen = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.


  i_fieldcat-col_pos = 6.
  i_fieldcat-fieldname = 'ERNAM'.
  i_fieldcat-tabname = 'LT_MARA'.
  i_fieldcat-ref_fieldname = 'ERNAM'.
  i_fieldcat-ref_tabname = 'MARA'.
  i_fieldcat-key = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  i_fieldcat-seltext_m = 'CREATED BY'.
  i_fieldcat-outputlen = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.


  i_fieldcat-col_pos = 6.
  i_fieldcat-fieldname = 'XCHAR'.
  i_fieldcat-tabname = 'LT_MARA'.
  i_fieldcat-ref_fieldname = 'XCHAR'.
  i_fieldcat-ref_tabname = 'MARC'.
  i_fieldcat-key = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  i_fieldcat-seltext_m = 'CREATED BY'.
  i_fieldcat-outputlen = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.


  i_fieldcat-col_pos = 6.
  i_fieldcat-fieldname = 'MAKTX'.
  i_fieldcat-tabname = 'LT_MARA'.
  i_fieldcat-ref_fieldname = 'XCHAR'.
  i_fieldcat-ref_tabname = 'MAKT'.
  i_fieldcat-key = ''.
  i_fieldcat-emphasize = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  i_fieldcat-seltext_m = 'MATERIAL DESCRIPTION'.
  i_fieldcat-outputlen = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.



  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_program_name     = sy-cprog
      i_internal_tabname = 'LT_MARA'
      i_inclname         = sy-cprog
    CHANGING
      ct_fieldcat        = i_fieldcat[].


  PERFORM top-of-page.


  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program     = sy-cprog
      i_callback_top_of_page = 'TOP-OF-PAGE'
      it_fieldcat            = i_fieldcat[]
    TABLES
      t_outtab               = lt_mara.



*&---------------------------------------------------------------------*
*& Form TOP-OF-PAGE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM top-of-page .

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
