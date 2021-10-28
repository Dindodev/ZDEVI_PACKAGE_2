*&---------------------------------------------------------------------*
*& Report Z07R_ALV_GRID_FINAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z07R_ALV_GRID_FINAL.
*&---------------------------------------------------------------------*
*& Report Z07R_ALV_GRID
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

TABLES: mara, makt,marc,mard.
TYPE-POOLS:slis.
PARAMETERS: p_mtart TYPE mara-mtart.

SELECT-OPTIONS: s_matnr FOR mara-matnr.
TYPES: BEGIN OF lw_mara,
         lv_matnr TYPE mara-matnr,
         lv_werks TYPE marc-werks,
         lv_lgort TYPE mard-lgort,
         lv_mtart TYPE mara-mtart,
         lv_ersda TYPE mara-ersda,
         lv_ernam TYPE mara-ernam,
         lv_xchar TYPE marc-xchar,
         lv_maktx TYPE makt-maktx,


       END OF lw_mara.



DATA:i_fieldcat TYPE slis_t_fieldcat_alv WITH HEADER LINE,
     it_mara    TYPE TABLE OF lw_mara.
DATA: it_listheader TYPE slis_t_listheader,
      wa_listheader TYPE slis_listheader.

START-OF-SELECTION.

  SELECT mara~matnr marc~werks mard~lgort mara~mtart mara~ersda mara~ernam marc~xchar makt~maktx
    FROM mara INNER JOIN marc ON mara~matnr = marc~matnr INNER JOIN mard ON mara~matnr = mard~matnr INNER JOIN makt ON mara~matnr = makt~matnr INTO TABLE it_mara
    WHERE mara~matnr IN s_matnr AND mara~mtart EQ p_mtart.

  i_fieldcat-col_pos = 1.
  i_fieldcat-fieldname = 'LV_MATNR'.
  i_fieldcat-tabname = 'IT_MARA'.
  i_fieldcat-ref_fieldname = 'MATNR'.
  i_fieldcat-ref_tabname = 'MARA'.
  i_fieldcat-key = ''.

  i_fieldcat-lowercase = 'X'.
  i_fieldcat-seltext_m = 'Material Number'.
  i_fieldcat-outputlen = 20.
  i_fieldcat-hotspot = 'X'.
  i_fieldcat-do_sum = 'X'.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.

  i_fieldcat-col_pos = 2.
  i_fieldcat-fieldname = 'LV_WERKS'.
  i_fieldcat-tabname = 'IT_MARA'.
  i_fieldcat-ref_fieldname = 'WERKS'.
  i_fieldcat-ref_tabname = 'MARC'.
  i_fieldcat-key = ''.

  i_fieldcat-lowercase = 'X'.
  i_fieldcat-seltext_m = 'Plant'.
  i_fieldcat-outputlen = 10.
  i_fieldcat-hotspot = 'X'.
  i_fieldcat-do_sum = space.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.

  i_fieldcat-col_pos = 3.
  i_fieldcat-fieldname = 'LV_LGORT'.
  i_fieldcat-tabname = 'IT_MARD'.
  i_fieldcat-ref_fieldname = 'LGORT'.
  i_fieldcat-ref_tabname = 'EKKO'.
  i_fieldcat-key = ''.

  i_fieldcat-lowercase = 'X'.
  i_fieldcat-seltext_m = 'STORAGE LOCATION'.
  i_fieldcat-outputlen = 10.
  i_fieldcat-hotspot = 'X'.
  i_fieldcat-do_sum = space.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.

  i_fieldcat-col_pos = 4.
  i_fieldcat-fieldname = 'LV_MTART'.
  i_fieldcat-tabname = 'IT_MARA'.
  i_fieldcat-ref_fieldname = 'MTART'.
  i_fieldcat-ref_tabname = 'MARA'.
  i_fieldcat-key = ''.

  i_fieldcat-lowercase = 'X'.
  i_fieldcat-seltext_m = 'MATERIAL TYPE'.
  i_fieldcat-outputlen = 10.
  i_fieldcat-hotspot = 'X'.
  i_fieldcat-do_sum = space.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.

  i_fieldcat-col_pos = 5.
  i_fieldcat-fieldname = 'LV_ERSDA'.
  i_fieldcat-tabname = 'IT_MARA'.
  i_fieldcat-ref_fieldname = 'ERSDA'.
  i_fieldcat-ref_tabname = 'MARA'.
  i_fieldcat-key = ''.

  i_fieldcat-lowercase = 'X'.
  i_fieldcat-seltext_m = 'CREATED ON'.
  i_fieldcat-outputlen = 10.
  i_fieldcat-hotspot = 'X'.
  i_fieldcat-do_sum = space.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.
  i_fieldcat-col_pos = 6.
  i_fieldcat-fieldname = 'LV_ERNAM'.
  i_fieldcat-tabname = 'IT_MARA'.
  i_fieldcat-ref_fieldname = 'ERNAM'.
  i_fieldcat-ref_tabname = 'MARA'.
  i_fieldcat-key = ''.

  i_fieldcat-lowercase = 'X'.
  i_fieldcat-seltext_m = 'OWNER'.
  i_fieldcat-outputlen = 10.
  i_fieldcat-hotspot = 'X'.
  i_fieldcat-do_sum = space.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.
  i_fieldcat-col_pos = 7.
  i_fieldcat-fieldname = 'LV_XCHAR'.
  i_fieldcat-tabname = 'IT_MARA'.
  i_fieldcat-ref_fieldname = 'XCHAR'.
  i_fieldcat-ref_tabname = 'MARC'.
  i_fieldcat-key = ''.

  i_fieldcat-lowercase = 'X'.
  i_fieldcat-seltext_m = 'BATCH MANAGER INDICATOR'.
  i_fieldcat-outputlen = 10.
  i_fieldcat-hotspot = 'X'.
  i_fieldcat-do_sum = space.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.
  i_fieldcat-col_pos = 8.
  i_fieldcat-fieldname = 'LV_MAKTX'.
  i_fieldcat-tabname = 'IT_MARA'.
  i_fieldcat-ref_fieldname = 'MAKTX'.
  i_fieldcat-ref_tabname = 'MAKT'.
  i_fieldcat-key = ''.

  i_fieldcat-lowercase = 'X'.
  i_fieldcat-seltext_m = 'MATERIAL DESCRIPTION'.
  i_fieldcat-outputlen = 10.
  i_fieldcat-hotspot = 'X'.
  i_fieldcat-do_sum = space.
  APPEND i_fieldcat TO i_fieldcat.
  CLEAR i_fieldcat.

PERFORM build_alv_header.



*DISPLAYING REPORT AS ALV GRID
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = sy-cprog
        i_callback_top_of_page = 'TOP_OF_PAGE'
      it_fieldcat        = i_fieldcat[]
    TABLES
      t_outtab           = it_mara.

INCLUDE z07r_alv_grid_build_alv_heaf02.

INCLUDE z07r_alv_grid_final_build_af01.

INCLUDE z07r_alv_grid_final_top_of_f01.

 TOP-OF-PAGE.
 Perform top_of_page.
