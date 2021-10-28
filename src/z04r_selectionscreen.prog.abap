*&---------------------------------------------------------------------*
*& Report Z04R_SELECTIONSCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04r_selectionscreen.

TABLES : vbak.

SELECT-OPTIONS sales FOR vbak-vbeln OBLIGATORY.

TYPES : BEGIN OF ty_vbak,
          sdoc   TYPE vbak-vbeln,
          sdate  TYPE vbak-erdat,
          sdtype TYPE vbak-auart,
        END OF ty_vbak.


DATA: it_vbak TYPE TABLE OF ty_vbak,
      lw_vbak TYPE ty_vbak.
TABLES : vbap.


*select-OPTIONS sales for vbak-VBELN.

TYPES : BEGIN OF ty_vbap,
          sdoc   TYPE vbap-vbeln,
          smnum  TYPE vbap-matnr,
          smgrp  TYPE vbap-matkl,
          sdtype TYPE vbap-pstyv,
        END OF ty_vbap.


DATA: it_vbap TYPE TABLE OF ty_vbap,
      lw_vbap TYPE ty_vbap.



START-OF-SELECTION.

  SELECT   vbeln erdat auart FROM vbak INTO TABLE it_vbak WHERE vbeln IN sales.
*IF sy-subrc EQ 0.
  IF NOT it_vbak[] IS INITIAL.
    LOOP AT it_vbak INTO lw_vbak.
      WRITE lw_vbak-sdoc.
      WRITE lw_vbak-sdtype.
      WRITE lw_vbak-sdate.
      HIDE : sales.
    ENDLOOP.
  ELSE.
    MESSAGE 'Incorrect Value' TYPE 'E'.
  ENDIF.


AT LINE-SELECTION.

  SELECT vbeln matnr matkl pstyv FROM vbap INTO TABLE it_vbap WHERE vbeln IN sales.

  LOOP AT it_vbap INTO lw_vbap.
    WRITE lw_vbap.
  ENDLOOP.
