*&---------------------------------------------------------------------*
*& Report Z10R_BDC_SESSION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z10R_BDC_SESSION.


DATA:BEGIN OF itab OCCURS 0,
     matnr LIKE mara-matnr,
     mbrsh LIKE mara-mbrsh,
     mtart LIKE mara-mtart,
     maktx LIKE makt-maktx,
     meins LIKE mara-meins,
     END OF itab .

CALL FUNCTION 'GUI_UPLOAD'
  EXPORTING
    filename            = 'D:\Documents and Settings\Administrator\Desktop\bdc.txt'
    has_field_separator = 'X'
  TABLES
    data_tab            = itab.

INCLUDE bdcrecx1.

START-OF-SELECTION.

  PERFORM open_group.

  LOOP AT itab.

    PERFORM bdc_dynpro      USING 'SAPLMGMM' '0060'.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'RMMG1-MATNR'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '/00'.
    PERFORM bdc_field       USING 'RMMG1-MATNR'
                                  itab-matnr.
    PERFORM bdc_field       USING 'RMMG1-MBRSH'
                                  itab-mbrsh.
    PERFORM bdc_field       USING 'RMMG1-MTART'
                                  itab-mtart.
    PERFORM bdc_dynpro      USING 'SAPLMGMM' '0070'.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'MSICHTAUSW-DYTXT(02)'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '=ENTR'.
    PERFORM bdc_field       USING 'MSICHTAUSW-KZSEL(01)'
                                  'X'.
    PERFORM bdc_field       USING 'MSICHTAUSW-KZSEL(02)'
                                  'X'.
    PERFORM bdc_dynpro      USING 'SAPLMGMM' '4004'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '/00'.
    PERFORM bdc_field       USING 'MAKT-MAKTX'
                                  itab-maktx .
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'MARA-BISMT'.
    PERFORM bdc_field       USING 'MARA-MEINS'
                                  itab-meins.
    PERFORM bdc_field       USING 'MARA-MTPOS_MARA'
                                  'NORM'.
    PERFORM bdc_dynpro      USING 'SAPLMGMM' '4004'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '/00'.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'MAKT-MAKTX'.
    PERFORM bdc_field       USING 'MAKT-MAKTX'
                                  'this is the test material by venkat'.
    PERFORM bdc_dynpro      USING 'SAPLSPO1' '0300'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '=YES'.
    PERFORM bdc_transaction USING 'MM01'.
  ENDLOOP.
  PERFORM close_group.
