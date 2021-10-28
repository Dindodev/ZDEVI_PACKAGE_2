*&---------------------------------------------------------------------*
*& Include Z03_INCLUDE_3_TOP                        - Module Pool      Z03_MODPRG_3
*&---------------------------------------------------------------------*
PROGRAM z03_modprg_3.
TABLES: vbap, vbak.
TYPES: BEGIN OF ts_sales,
         posnr  TYPE posnr,
         matnr  TYPE matnr,
         arktx  TYPE arktx,
         werks  TYPE werks,
         kwmeng TYPE kwmeng,
         vrkme  TYPE vrkme,
       END OF ts_sales.

*CONTROLS: tc_SALES TYPE TABLEVIEW USING SCREEN 9000.

DATA : lv_so    TYPE vbak-vbeln,
       it_sales TYPE TABLE OF ts_sales WITH HEADER LINE,
       iw_sales TYPE ts_sales.
