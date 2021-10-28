report Z03_RECORD_TRANSACTION
       no standard page heading line-size 255.

* Include bdcrecx1_s:
* The call transaction using is called WITH AUTHORITY-CHECK!
* If you have own auth.-checks you can use include bdcrecx1 instead.
include bdcrecx1_s.

start-of-selection.

perform open_group.

perform bdc_dynpro      using 'SAPLMGMM' '0060'.
perform bdc_field       using 'BDC_CURSOR'
                              'RMMG1-MBRSH'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'RMMG1-MATNR'
                              'Z03_Mat1'.
perform bdc_field       using 'RMMG1-MBRSH'
                              'M'.
perform bdc_field       using 'RMMG1-MTART'
                              'CHFP'.
perform bdc_dynpro      using 'SAPLMGMM' '0070'.
perform bdc_field       using 'BDC_CURSOR'
                              'MSICHTAUSW-DYTXT(02)'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'MSICHTAUSW-KZSEL(01)'
                              'X'.
perform bdc_field       using 'MSICHTAUSW-KZSEL(02)'
                              'X'.
perform bdc_dynpro      using 'SAPLMGMM' '4004'.
perform bdc_field       using 'BDC_OKCODE'
                              '/00'.
perform bdc_field       using 'MAKT-MAKTX'
                              'Reording - Assignment Z03'.
perform bdc_field       using 'BDC_CURSOR'
                              'MARA-MEINS'.
perform bdc_field       using 'MARA-MEINS'
                              'CM'.
perform bdc_dynpro      using 'SAPLMGMM' '4004'.
perform bdc_field       using 'BDC_OKCODE'
                              '/00'.
perform bdc_field       using 'BDC_CURSOR'
                              'MAKT-MAKTX'.
perform bdc_field       using 'MAKT-MAKTX'
                              'Reording - Assignment Z03'.
perform bdc_dynpro      using 'SAPLSPO1' '0300'.
perform bdc_field       using 'BDC_OKCODE'
                              '=YES'.
perform bdc_transaction using 'MM01'.

perform close_group.
