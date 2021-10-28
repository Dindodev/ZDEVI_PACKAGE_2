*&---------------------------------------------------------------------*
*& Include Z07_INCLUDE4_TOP                         - Module Pool      Z07M_MODPROG_FINAL
*&---------------------------------------------------------------------*
PROGRAM Z07M_MODPROG_FINAL.
TABLES: vbap, vbak.
TYPES: BEGIN OF ts_sales,
         posnr  TYPE posnr,
         matnr  TYPE matnr,
         arktx  TYPE arktx,
         werks  TYPE werks,
         kwmeng TYPE kwmeng,
         vrkme  TYPE vrkme,
       END OF ts_sales.

CONTROLS: tc_9000 TYPE TABLEVIEW USING SCREEN 9000.

DATA : lv_so    TYPE vbak-vbeln,
       it_sales TYPE TABLE OF ts_sales WITH HEADER LINE,
       iw_sales TYPE ts_sales.
