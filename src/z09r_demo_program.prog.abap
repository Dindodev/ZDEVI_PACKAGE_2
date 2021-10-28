*&---------------------------------------------------------------------*
*& Report Z09R_DEMO_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z09r_demo_program.

TABLES : vbak.

TABLES : vbap.



SELECT-OPTIONS : sales FOR vbak-vbeln.
TYPES : BEGIN OF ty_structure,

          salesDoc  TYPE vbak-vbeln,
          creationDate TYPE vbak-erdat,
          salesDocType  TYPE vbak-auart,

        END OF ty_structure.

TYPES : BEGIN OF ty_structure2,

          salesDoc       TYPE vbap-vbeln,
          salesDocItem   TYPE vbap-posnr,
          materialNo     TYPE vbap-matnr,
          materialGroup   TYPE vbap-matkl,

        END OF ty_structure2.

DATA : lt_table     TYPE TABLE OF ty_structure,
       ls_structure TYPE ty_structure,
       lt_table2     TYPE TABLE OF ty_structure2,
       ls_structure2 TYPE ty_structure2.

AT SELECTION-SCREEN.



START-OF-SELECTION.
  SELECT vbeln erdat auart FROM vbak INTO TABLE lt_table WHERE vbeln IN sales.

  LOOP AT lt_table INTO ls_structure.
    WRITE:/ ls_structure-salesDoc, ls_structure-creationDate, ls_structure-salesDocType.
    HIDE: sales.
  ENDLOOP.

  AT LINE-SELECTION.

 SELECT vbeln posnr matnr matkl FROM vbap INTO TABLE lt_table2 WHERE vbeln IN sales.


 LOOP AT lt_table2 INTO ls_structure2 .
 WRITE :  ls_structure2-salesDoc ,
 ls_structure2-salesDocItem,
 ls_structure2-materialNo, ls_structure2-materialGroup.

 NEW-LINE.                                "/NEW LINE
ENDLOOP.
