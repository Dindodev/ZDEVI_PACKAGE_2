*&---------------------------------------------------------------------*
*& Report Z06R_DEMO_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06r_demo_program.

*TABLES :vbak.
*
*SELECT-OPTIONS: sales FOR vbak-vbeln.
*
*Types: begin of ty_struct,
*
*  lv_SalesDoc type vbak-vbeln,
*  lv_erdat type vbak-erdat,
*  lv_auart type vbak-auart,
*
*    END OF ty_struct.
*
*Data: ls_struct type STANDARD TABLE OF ty_struct.
*      wa_vbak type ty_struct.
*
*TABLES:vbap.
*
*    TYPES : BEGIN OF ly_structure,
*          salesdoc   TYPE vbap-vbeln,
*          smatnum  TYPE vbap-matnr,
*          smgrp  TYPE vbap-matkl,
*          smatItem TYPE vbap-posnr,
*        END OF ly_structure.
*
*
*DATA: it_table1 TYPE TABLE OF ly_structure,
*      is1_structure TYPE ly_structure.
*
*START-OF-SELECTION.
*SELECT vbeln erdat auart FROM vbak INTO TABLE ls_struct WHERE vbeln in sales.
*
*
*  loop at ls_struct INTO wa_vbak.
*
*  write wa_vbak-lv_SalesDoc.
*  write wa_vbak-lv_erdat.
*  write wa_vbak-lv_auart.
*
*  endloop.
*
*AT LINE-SELECTION.
*
*  SELECT vbeln matnr matkl pstyv FROM vbap INTO TABLE it_table1 WHERE vbeln IN sales.
*
*  LOOP AT it_table1 INTO is1_structure.
*    WRITE is1_structure.
*  ENDLOOP.
**************************************

TABLES : vbak.

SELECT-OPTIONS sales FOR vbak-vbeln OBLIGATORY.

TYPES : BEGIN OF ty_structure,
          sdoc   TYPE vbak-vbeln,
          sdate  TYPE vbak-erdat,
          sdtype TYPE vbak-auart,
        END OF ty_structure.


DATA: it_table     TYPE TABLE OF ty_structure,
      is_structure TYPE ty_structure.
TABLES : vbap.

*select-OPTIONS sales for vbak-VBELN.

TYPES : BEGIN OF ly_structure,
          sdoc   TYPE vbap-vbeln,
          smnum  TYPE vbap-matnr,
          smgrp  TYPE vbap-matkl,
          sdtype TYPE vbap-pstyv,
        END OF ly_structure.


DATA: it_table1     TYPE TABLE OF ly_structure,
      is1_structure TYPE ly_structure.

START-OF-SELECTION.

  SELECT   vbeln erdat auart FROM vbak INTO TABLE it_table WHERE vbeln IN sales.

  LOOP AT it_table INTO is_structure.
    IF sy-subrc EQ 0.
    WRITE is_structure-sdoc.
    WRITE is_structure-sdtype.
    WRITE is_structure-sdate.
    HIDE : sales.
    ELSE.
      MESSAGE 'Enter Value' TYPE 'E'.
      ENDIF.
  ENDLOOP.

AT LINE-SELECTION.

  SELECT vbeln matnr matkl pstyv FROM vbap INTO TABLE it_table1 WHERE vbeln IN sales.

  LOOP AT it_table1 INTO is1_structure.
    WRITE is1_structure.
  ENDLOOP.
