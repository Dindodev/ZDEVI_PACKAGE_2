*&---------------------------------------------------------------------*
*& Report Z12R_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z12r_alv.

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


DATA:I_FIELDCAT TYPE SLIS_T_FIELDCAT_ALV WITH HEADER LINE.


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





  I_FIELDCAT-COL_POS = 1.
  I_FIELDCAT-FIELDNAME = 'MATNR'.
  I_FIELDCAT-TABNAME = 'LT_MARA'.
  I_FIELDCAT-REF_FIELDNAME = 'MATNR'.
  I_FIELDCAT-REF_TABNAME = 'mara'.
  I_FIELDCAT-KEY = 'X'.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  I_FIELDCAT-SELTEXT_M = 'MATERIAL NUMBER'.
  I_FIELDCAT-OUTPUTLEN = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND I_FIELDCAT TO I_FIELDCAT.
  CLEAR I_FIELDCAT.


  I_FIELDCAT-COL_POS = 2.
  I_FIELDCAT-FIELDNAME = 'WERKS'.
  I_FIELDCAT-TABNAME = 'LT_MARA'.
  I_FIELDCAT-REF_FIELDNAME = 'WERKS'.
  I_FIELDCAT-REF_TABNAME = 'MARC'.
  I_FIELDCAT-KEY = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  I_FIELDCAT-SELTEXT_M = 'PLANT'.
  I_FIELDCAT-OUTPUTLEN = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND I_FIELDCAT TO I_FIELDCAT.
  CLEAR I_FIELDCAT.


  I_FIELDCAT-COL_POS = 3.
  I_FIELDCAT-FIELDNAME = 'LGORT'.
  I_FIELDCAT-TABNAME = 'LT_MARA'.
  I_FIELDCAT-REF_FIELDNAME = 'LGORT'.
  I_FIELDCAT-REF_TABNAME = 'MARD'.
  I_FIELDCAT-KEY = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  I_FIELDCAT-SELTEXT_M = 'STORAGE LOCATION'.
  I_FIELDCAT-OUTPUTLEN = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND I_FIELDCAT TO I_FIELDCAT.
  CLEAR I_FIELDCAT.


   I_FIELDCAT-COL_POS = 4.
  I_FIELDCAT-FIELDNAME = 'MTART'.
  I_FIELDCAT-TABNAME = 'LT_MARA'.
  I_FIELDCAT-REF_FIELDNAME = 'MTART'.
  I_FIELDCAT-REF_TABNAME = 'MARA'.
  I_FIELDCAT-KEY = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  I_FIELDCAT-SELTEXT_M = 'Material Type'.
  I_FIELDCAT-OUTPUTLEN = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND I_FIELDCAT TO I_FIELDCAT.
  CLEAR I_FIELDCAT.


  I_FIELDCAT-COL_POS = 5.
  I_FIELDCAT-FIELDNAME = 'ERSDA'.
  I_FIELDCAT-TABNAME = 'LT_MARA'.
  I_FIELDCAT-REF_FIELDNAME = 'ERSDA'.
  I_FIELDCAT-REF_TABNAME = 'MARA'.
  I_FIELDCAT-KEY = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  I_FIELDCAT-SELTEXT_M = 'CREATED ON'.
  I_FIELDCAT-OUTPUTLEN = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND I_FIELDCAT TO I_FIELDCAT.
  CLEAR I_FIELDCAT.


   I_FIELDCAT-COL_POS = 6.
  I_FIELDCAT-FIELDNAME = 'ERNAM'.
  I_FIELDCAT-TABNAME = 'LT_MARA'.
  I_FIELDCAT-REF_FIELDNAME = 'ERNAM'.
  I_FIELDCAT-REF_TABNAME = 'MARA'.
  I_FIELDCAT-KEY = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  I_FIELDCAT-SELTEXT_M = 'CREATED BY'.
  I_FIELDCAT-OUTPUTLEN = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND I_FIELDCAT TO I_FIELDCAT.
  CLEAR I_FIELDCAT.


   I_FIELDCAT-COL_POS = 6.
  I_FIELDCAT-FIELDNAME = 'XCHAR'.
  I_FIELDCAT-TABNAME = 'LT_MARA'.
  I_FIELDCAT-REF_FIELDNAME = 'XCHAR'.
  I_FIELDCAT-REF_TABNAME = 'MARC'.
  I_FIELDCAT-KEY = ''.
*  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  I_FIELDCAT-SELTEXT_M = 'CREATED BY'.
  I_FIELDCAT-OUTPUTLEN = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND I_FIELDCAT TO I_FIELDCAT.
  CLEAR I_FIELDCAT.


   I_FIELDCAT-COL_POS = 6.
  I_FIELDCAT-FIELDNAME = 'MAKTX'.
  I_FIELDCAT-TABNAME = 'LT_MARA'.
  I_FIELDCAT-REF_FIELDNAME = 'XCHAR'.
  I_FIELDCAT-REF_TABNAME = 'MAKT'.
  I_FIELDCAT-KEY = ''.
  I_FIELDCAT-EMPHASIZE = 'C510'.
*  I_FIELDCAT-LOWERCASE = 'X'.
  I_FIELDCAT-SELTEXT_M = 'MATERIAL DESCRIPTION'.
  I_FIELDCAT-OUTPUTLEN = 20.
*  I_FIELDCAT-HOTSPOT = 'X'.
*  I_FIELDCAT-DO_SUM = 'X'.
  APPEND I_FIELDCAT TO I_FIELDCAT.
  CLEAR I_FIELDCAT.



 CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
  EXPORTING
    I_PROGRAM_NAME = SY-CPROG
    I_INTERNAL_TABNAME = 'LT_MARA'
    I_INCLNAME = SY-CPROG
  CHANGING
    ct_fieldcat = I_FIELDCAT[].





PERFORM top-of-page.


CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    I_CALLBACK_PROGRAM = SY-CPROG
    i_callback_top_of_page = 'TOP-OF-PAGE'
    IT_FIELDCAT = I_FIELDCAT[]
  TABLES
    t_outtab = LT_MARA.


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


    call function 'REUSE_ALV_COMMENTARY_WRITE'
       EXPORTING
            it_list_commentary = lt_header.
  ENDFORM.
