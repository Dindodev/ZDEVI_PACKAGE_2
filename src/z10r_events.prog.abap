*&---------------------------------------------------------------------*
*& Report Z10R_EVENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z10r_events.

TABLES: vbak, vbap.

TYPES : BEGIN OF l_ty_vbak,
          vbeln TYPE vbeln_va,
          erdat TYPE erdat,
          auart TYPE auart,
        END OF l_ty_vbak.


TYPES : BEGIN OF l_ty_vbap,
          vbeln TYPE vbeln_va,
          erdat TYPE erdat,
          matkl TYPE matkl,
        END OF l_ty_vbap.

DATA : lt_vbak TYPE TABLE OF l_ty_vbak,
       ls_vbak TYPE l_ty_vbak,
       lt_vbap TYPE TABLE OF l_ty_vbap,
       ls_vbap TYPE l_ty_vbap.

SELECT-OPTIONS s_slsord FOR vbak-vbeln.


START-OF-SELECTION.


  IF s_slsord IS INITIAL.
    MESSAGE 'Sales order cannot be empty' TYPE 'E'.
  ELSE.
    SELECT vbeln erdat auart FROM vbak INTO TABLE lt_vbak WHERE vbeln IN s_slsord.
    IF sy-subrc = 0.
      LOOP AT lt_vbak INTO ls_vbak.
        WRITE:/ ls_vbak-vbeln , ls_vbak-erdat, ls_vbak-auart.
        HIDE : ls_vbak-vbeln.
      ENDLOOP.
    ENDIF.

  ENDIF.






AT LINE-SELECTION.
  SELECT vbeln erdat matkl FROM vbap INTO TABLE lt_vbap WHERE vbeln = ls_vbak-vbeln.
  IF sy-subrc = 0.
    LOOP AT lt_vbap INTO ls_vbap.
      WRITE:/ ls_vbap-vbeln , ls_vbap-erdat, ls_vbap-matkl.

    ENDLOOP.
  ENDIF.
