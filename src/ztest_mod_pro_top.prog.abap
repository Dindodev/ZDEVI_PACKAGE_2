*&---------------------------------------------------------------------*
*& Include          ZTEST_MOD_PRO_TOP
*&---------------------------------------------------------------------*
 PROGRAM ZTEST_MOD_PRO_TOP.

 Tables: vbap,vbak.
 Types: BEGIN OF ty_vbak,
   vbeln type vbak-vbeln,
   vkorg type vbak-vkorg,
   end of ty_vbak.
   Data : it_vbak type table of vbak,
         wa_vbak type vbak,
         ok_code type sy-ucomm,
         lv_vbeln type vbak-vbeln.
   SELECTION-SCREEN BEGIN OF SCREEN 100 as SUBSCREEN.
     select-OPTIONS vbeln for vbak-vbeln.
     SELECTION-SCREEN END OF SCREEN 100.
