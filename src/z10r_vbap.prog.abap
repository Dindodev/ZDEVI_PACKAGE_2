*&---------------------------------------------------------------------*
*& Report Z10R_VBAP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z10R_VBAP.

TABLES: vbap.

  TYPES : BEGIN OF l_ty_vbap,
            vbeln TYPE vbeln_va,
            erdat TYPE erdat,
            matkl TYPE matkl,
          END OF l_ty_vbap.

  DATA : lt_vbap TYPE TABLE OF l_ty_vbap,
         ls_vbap TYPE l_ty_vbap.

SELECT-OPTIONS s_slordp FOR vbap-vbeln.

  SELECT vbeln erdat matkl FROM vbap INTO TABLE lt_vbap WHERE vbeln IN s_slordp.
  LOOP AT lt_vbap INTO ls_vbap.
    WRITE:/ ls_vbap-vbeln , ls_vbap-erdat, ls_vbap-matkl.

  ENDLOOP.
