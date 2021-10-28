*&---------------------------------------------------------------------*
*& Report Z05R_SELECTIONEVENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z05R_SELECTIONEVENTS.
TABLES : vbak.
TABLES : vbap.
*select-OPTIONS sales for vbak-VBELN.
SELECT-OPTIONS s_Sales FOR vbak-vbeln OBLIGATORY.

TYPES : BEGIN OF ty_structure,
          sdoc   TYPE vbak-vbeln,
          sdate  TYPE vbak-erdat,
          sdtype TYPE vbak-auart,
        END OF ty_structure.


DATA: lt_table     TYPE TABLE OF ty_structure,
      ls_structure TYPE ty_structure.




TYPES : BEGIN OF ty_structure2,
          sdoc   TYPE vbap-vbeln,
          smnum  TYPE vbap-matnr,
          smgrp  TYPE vbap-matkl,
          sdtype TYPE vbap-pstyv,
        END OF ty_structure2.


DATA: lt_table2    TYPE TABLE OF ty_structure2,
      ls_structure2 TYPE ty_structure2.

START-OF-SELECTION.

  SELECT   vbeln erdat auart FROM vbak INTO TABLE lt_table WHERE vbeln IN s_Sales.
 IF sy-subrc EQ 0.
  LOOP AT lt_table INTO ls_structure.

    WRITE  ls_structure-sdoc.
    WRITE ls_structure-sdtype.
    WRITE ls_structure-sdate.
    NEW-LINE NO-SCROLLING.
    HIDE : s_Sales.

  ENDLOOP.
 ELSE.
      MESSAGE 'Enter Correct Range' TYPE 'E'.
      ENDIF.
AT LINE-SELECTION.

  SELECT vbeln matnr matkl pstyv FROM vbap INTO TABLE lt_table2 WHERE vbeln IN s_Sales.
IF sy-subrc EQ 0.
  LOOP AT lt_table2 INTO ls_structure2.

    WRITE: / ls_structure2.

  ENDLOOP.
   ELSE.
      MESSAGE 'You havent selected correct entry.' TYPE 'E'.
      ENDIF.
