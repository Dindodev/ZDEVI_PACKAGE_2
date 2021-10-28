*&---------------------------------------------------------------------*
*& Report Z11R_DEMO_INT_REP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z11r_demo_int_rep.

TABLES: vbak, vbap.

TYPES : BEGIN OF ty_vbak,
          auart TYPE vbak-auart,
          vbeln TYPE vbak-vbeln,
          ernam TYPE vbak-ernam,
          netwr TYPE vbak-netwr,
        END OF ty_vbak,

        BEGIN OF ty_vbap,
          vbeln TYPE vbak-vbeln,
          posnr TYPE vbap-posnr,
          matnr TYPE vbap-matnr,
          zmeng TYPE vbap-zmeng,
        END OF ty_vbap.

 DATA : lt_vbak TYPE TABLE OF ty_vbak,
        ls_vbak TYPE ty_vbak,
        lt_vbap type TABLE OF ty_vbap,
        ls_vbap type ty_vbap.

PARAMETERS p_SO TYPE vbak-vbeln OBLIGATORY.
select-OPTIONS s_sdoc FOR vbak-auart.

START-OF-SELECTION.
  SELECT  auart vbeln ernam  netwr
      FROM vbak
      INTO TABLE lt_vbak
      WHERE auart in s_sdoc and vbeln =  p_SO.

  LOOP AT lt_vbak INTO ls_vbak.
      WRITE:/1  ls_vbak-auart ,
             20 ls_vbak-vbeln HOTSPOT,
             40 ls_vbak-ernam,
             60 ls_vbak-netwr.
         hide ls_vbak-vbeln.
  ENDLOOP.

AT LINE-SELECTION.
CASE sy-lsind.

  WHEN 1.
    SELECT vbeln posnr matnr zmeng  FROM vbap into TABLE lt_vbap where vbeln = ls_vbak-vbeln.

     LOOP AT lt_vbap INTO ls_vbap.
      WRITE:/1  ls_vbap-matnr ,
             20 ls_vbap-posnr,
             40 ls_vbap-vbeln,
             60 ls_vbap-zmeng.
  ENDLOOP.


  WHEN OTHERS.
    MESSAGE 'Not Found ' type 'E'.
ENDCASE.
