*&---------------------------------------------------------------------*
*& Report Z04ALV_ALV_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z04ALV_ALV_REPORT.

TABLES: mara,
  makt,
   marc,
    mard.

SELECT-OPTIONS:S_mat FOR mara-matnr.
PARAMETERS : p_mtype type mara-mtart.

TYPES: BEGIN OF ty_mara,
  lv_mnum type mara-matnr,
  lv_pname type mara-ernam,
  lv_mtype type mara-mtart,
  lv_plant type marc-werks,
  lv_sloc type mard-lgort,
  lv_date type mara-ersda,
  lv_batch type marc-xchar,
  lv_desc type makt-maktx,

  END OF ty_mara.

  Data : it_mara type TABLE OF ty_mara,
        lw_mara type ty_mara.

* *Internal table and workarea declaration for alv dialog display
*DATA : it_display TYPE STANDARD TABLE OF ty_output INITIAL SIZE 0,
*       wa_display TYPE ty_output.
*data declarations for ALV
DATA:ls_fieldcat TYPE slis_fieldcat_alv,
    lt_fieldcat TYPE slis_t_fieldcat_alv,
    ls_fieldcatlog TYPE slis_fieldcat_alv,
    lt_fieldcatlog TYPE slis_t_fieldcat_alv,
    lt_layout TYPE slis_layout_alv.



  START-OF-SELECTION.


SELECT mara~matnr mara~ernam mara~mtart
        marc~werks
        mard~lgort

      mara~ersda

      marc~xchar
      makt~maktx
  INTO TABLE it_mara
  FROM mara INNER JOIN marc ON mara~matnr = marc~matnr
            INNER JOIN mard ON mara~matnr = mard~matnr
             INNER JOIN makt ON mara~matnr = makt~matnr

   WHERE mara~matnr IN s_mat AND mara~mtart = p_mtype.



 ls_FIELDCAT-COL_POS = 1.
  ls_FIELDCAT-FIELDNAME = 'MATNR'.
  ls_FIELDCAT-TABNAME = 'LT_MARA'.
  ls_FIELDCAT-REF_FIELDNAME = 'MATNR'.
  ls_FIELDCAT-REF_TABNAME = 'mara'.
  ls_FIELDCAT-KEY = 'X'.
*  ls_FIELDCAT-EMPHASIZE = 'C510'.
*  ls_FIELDCAT-LOWERCASE = 'X'.
  ls_FIELDCAT-SELTEXT_M = 'MATERIAL NUMBER'.
  ls_FIELDCAT-OUTPUTLEN = 20.
*  ls_FIELDCAT-HOTSPOT = 'X'.
*  ls_FIELDCAT-DO_SUM = 'X'.
  APPEND ls_FIELDCAT TO lt_FIELDCAT.
  CLEAR ls_FIELDCAT.

    ls_FIELDCAT-COL_POS = 2.
  ls_FIELDCAT-FIELDNAME = 'WERKS'.
  ls_FIELDCAT-TABNAME = 'LT_MARA'.
  ls_FIELDCAT-REF_FIELDNAME = 'WERKS'.
  ls_FIELDCAT-REF_TABNAME = 'MARC'.
  ls_FIELDCAT-KEY = ''.
*  ls_FIELDCAT-EMPHASIZE = 'C510'.
*  ls_FIELDCAT-LOWERCASE = 'X'.
  ls_FIELDCAT-SELTEXT_M = 'PLANT'.
  ls_FIELDCAT-OUTPUTLEN = 20.
*  ls_FIELDCAT-HOTSPOT = 'X'.
*  ls_FIELDCAT-DO_SUM = 'X'.
  APPEND ls_FIELDCAT TO lt_FIELDCAT.
  CLEAR ls_FIELDCAT.


  ls_FIELDCAT-COL_POS = 3.
  ls_FIELDCAT-FIELDNAME = 'LGORT'.
  ls_FIELDCAT-TABNAME = 'LT_MARA'.
  ls_FIELDCAT-REF_FIELDNAME = 'LGORT'.
  ls_FIELDCAT-REF_TABNAME = 'MARD'.
  ls_FIELDCAT-KEY = ''.
*  ls_FIELDCAT-EMPHASIZE = 'C510'.
*  ls_FIELDCAT-LOWERCASE = 'X'.
  ls_FIELDCAT-SELTEXT_M = 'STORAGE LOCATION'.
  ls_FIELDCAT-OUTPUTLEN = 20.
*  ls_FIELDCAT-HOTSPOT = 'X'.
*  ls_FIELDCAT-DO_SUM = 'X'.
  APPEND ls_FIELDCAT TO lt_FIELDCAT.
  CLEAR ls_FIELDCAT.


   ls_FIELDCAT-COL_POS = 4.
  ls_FIELDCAT-FIELDNAME = 'MTART'.
  ls_FIELDCAT-TABNAME = 'LT_MARA'.
  ls_FIELDCAT-REF_FIELDNAME = 'MTART'.
  ls_FIELDCAT-REF_TABNAME = 'MARA'.
  ls_FIELDCAT-KEY = ''.
*  ls_FIELDCAT-EMPHASIZE = 'C510'.
*  ls_FIELDCAT-LOWERCASE = 'X'.
  ls_FIELDCAT-SELTEXT_M = 'Material Type'.
  ls_FIELDCAT-OUTPUTLEN = 20.
*  ls_FIELDCAT-HOTSPOT = 'X'.
*  ls_FIELDCAT-DO_SUM = 'X'.
  APPEND ls_FIELDCAT TO lt_FIELDCAT.
  CLEAR ls_FIELDCAT.


  ls_FIELDCAT-COL_POS = 5.
  ls_FIELDCAT-FIELDNAME = 'ERSDA'.
  ls_FIELDCAT-TABNAME = 'LT_MARA'.
  ls_FIELDCAT-REF_FIELDNAME = 'ERSDA'.
  ls_FIELDCAT-REF_TABNAME = 'MARA'.
  ls_FIELDCAT-KEY = ''.
*  ls_FIELDCAT-EMPHASIZE = 'C510'.
*  ls_FIELDCAT-LOWERCASE = 'X'.
  ls_FIELDCAT-SELTEXT_M = 'CREATED ON'.
  ls_FIELDCAT-OUTPUTLEN = 20.
*  ls_FIELDCAT-HOTSPOT = 'X'.
*  ls_FIELDCAT-DO_SUM = 'X'.
  APPEND ls_FIELDCAT TO lt_FIELDCAT.
  CLEAR ls_FIELDCAT.


   ls_FIELDCAT-COL_POS = 6.
  ls_FIELDCAT-FIELDNAME = 'ERNAM'.
  ls_FIELDCAT-TABNAME = 'LT_MARA'.
  ls_FIELDCAT-REF_FIELDNAME = 'ERNAM'.
  ls_FIELDCAT-REF_TABNAME = 'MARA'.
  ls_FIELDCAT-KEY = ''.
*  ls_FIELDCAT-EMPHASIZE = 'C510'.
*  ls_FIELDCAT-LOWERCASE = 'X'.
  ls_FIELDCAT-SELTEXT_M = 'CREATED BY'.
  ls_FIELDCAT-OUTPUTLEN = 20.
*  ls_FIELDCAT-HOTSPOT = 'X'.
*  ls_FIELDCAT-DO_SUM = 'X'.
  APPEND ls_FIELDCAT TO lt_FIELDCAT.
  CLEAR ls_FIELDCAT.


   ls_FIELDCAT-COL_POS = 7.
  ls_FIELDCAT-FIELDNAME = 'XCHAR'.
  ls_FIELDCAT-TABNAME = 'LT_MARA'.
  ls_FIELDCAT-REF_FIELDNAME = 'XCHAR'.
  ls_FIELDCAT-REF_TABNAME = 'MARC'.
  ls_FIELDCAT-KEY = ''.
*  ls_FIELDCAT-EMPHASIZE = 'C510'.
*  ls_FIELDCAT-LOWERCASE = 'X'.
  ls_FIELDCAT-SELTEXT_M = 'CREATED BY'.
  ls_FIELDCAT-OUTPUTLEN = 20.
*  ls_FIELDCAT-HOTSPOT = 'X'.
*  ls_FIELDCAT-DO_SUM = 'X'.
  APPEND ls_FIELDCAT TO lt_FIELDCAT.
  CLEAR ls_FIELDCAT.




*Layout for ALV dialog
FORM build_layout .
  lt_layout-zebra = 'X'.
  lt_layout-colwidth_optimize = 'X'.
ENDFORM.                    " build_layout
*&---------------------------------------------------------------*
*&      Form  alv
*&---------------------------------------------------------------*
*Alv dialog output.
FORM alv .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program    = sy-repid
      i_grid_title          = 'Material DETAILS'
      is_layout             = lt_layout
      it_fieldcat           = lt_fieldcat
      i_screen_start_column = 10
      i_screen_start_line   = 20
      i_screen_end_column   = 100
      i_screen_end_line     = 40
    TABLES
      t_outtab              = it_mara[]
    EXCEPTIONS
      program_error         = 1
      OTHERS                = 2.
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
ENDFORM.
