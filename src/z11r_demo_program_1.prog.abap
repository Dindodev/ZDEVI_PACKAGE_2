*&---------------------------------------------------------------------*
*& Report Z11R_DEMO_PROGRAM_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z11r_demo_program_1.

TABLES vbak.
TYPES: BEGIN OF l_ty_tab,
         vbeln TYPE vbak-vbeln,
         erdat TYPE vbak-erdat,
         auart TYPE vbak-auart,
       END OF l_ty_tab.

TYPES:BEGIN OF l_ty_vbap,
        vbeln TYPE vbap-vbeln,
        posnr TYPE vbap-posar,
        matnr TYPE vbap-matnr,
        matkl TYPE vbap-matkl,

      END OF l_ty_vbap.


DATA : lt_vbak TYPE TABLE OF l_ty_tab,
       ls_vbak TYPE l_ty_tab,
       lt_vbap TYPE TABLE OF l_ty_vbap,
       ls_vbap TYPE l_ty_vbap.


SELECT-OPTIONS s_option FOR vbak-vbeln.

START-OF-SELECTION.

AT SELECTION-SCREEN ON s_option.
  IF s_option IS INITIAL.
    MESSAGE 'Please select range' TYPE 'E'.
  ELSE.

    SELECT  vbeln erdat auart FROM vbak INTO TABLE lt_vbak WHERE  vbeln IN s_option.
    IF sy-subrc NE 0.
      MESSAGE 'No Sales Order find for the selection criteria' TYPE 'E'.
    ENDIF.
  ENDIF.

END-OF-SELECTION.

  LOOP AT lt_vbak INTO ls_vbak.
    WRITE :/1 ls_vbak-vbeln,
    20 ls_vbak-erdat,
    40 ls_vbak-auart.
    HIDE:ls_vbak-vbeln.
  ENDLOOP.

AT LINE-SELECTION.
  SELECT vbeln posnr matnr matkl FROM vbap INTO TABLE lt_vbap WHERE vbeln = ls_vbak-vbeln.
  IF sy-subrc EQ 0.


    LOOP AT lt_vbap INTO ls_vbap.
      WRITE :/1 ls_vbap-vbeln,
              20 ls_vbap-posnr,
             40 ls_vbap-matnr,
             30 ls_vbap-matkl.
      HIDE:ls_vbak-vbeln.
    ENDLOOP.
  ENDIF.

TOP-OF-PAGE.
  WRITE : /1 'Material No' COLOR 1,
         40  'Discription' COLOR 2.
