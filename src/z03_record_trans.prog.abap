report Z03_RECORD_TRANS
       no standard page heading line-size 255.

* Include bdcrecx1_s:
* The call transaction using is called WITH AUTHORITY-CHECK!
* If you have own auth.-checks you can use include bdcrecx1 instead.
include bdcrecx1_s.

parameters: dataset(132) lower case.
***    DO NOT CHANGE - the generated data section - DO NOT CHANGE    ***
*
*   If it is nessesary to change the data section use the rules:
*   1.) Each definition of a field exists of two lines
*   2.) The first line shows exactly the comment
*       '* data element: ' followed with the data element
*       which describes the field.
*       If you don't have a data element use the
*       comment without a data element name
*   3.) The second line shows the fieldname of the
*       structure, the fieldname must consist of
*       a fieldname and optional the character '_' and
*       three numbers and the field length in brackets
*   4.) Each field must be type C.
*
*** Generated data section with specific formatting - DO NOT CHANGE  ***
data: begin of record,
* data element: MATNR
        MATNR_001(040),
* data element: MBRSH
        MBRSH_002(001),
* data element: MTART
        MTART_003(004),
* data element: XFELD
        KZSEL_01_004(001),
* data element: XFELD
        KZSEL_02_005(001),
* data element: MAKTX
        MAKTX_006(040),
* data element: MEINS
        MEINS_007(003),
* data element: MAKTX
        MAKTX_008(040),
      end of record.

*** End generated data section ***

start-of-selection.

perform open_dataset using dataset.
perform open_group.

do.

read dataset dataset into record.
if sy-subrc <> 0. exit. endif.

perform bdc_dynpro      using 'SAPLMGMM' '0060'.
perform bdc_field       using 'BDC_CURSOR'
                              'RMMG1-MTART'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'RMMG1-MATNR'
                              record-MATNR_001.
perform bdc_field       using 'RMMG1-MBRSH'
                              record-MBRSH_002.
perform bdc_field       using 'RMMG1-MTART'
                              record-MTART_003.
perform bdc_dynpro      using 'SAPLMGMM' '0070'.
perform bdc_field       using 'BDC_CURSOR'
                              'MSICHTAUSW-DYTXT(03)'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'MSICHTAUSW-KZSEL(01)'
                              record-KZSEL_01_004.
perform bdc_field       using 'MSICHTAUSW-KZSEL(02)'
                              record-KZSEL_02_005.
perform bdc_dynpro      using 'SAPLMGMM' '4004'.
perform bdc_field       using 'BDC_OKCODE'
                              '/00'.
perform bdc_field       using 'MAKT-MAKTX'
                              record-MAKTX_006.
perform bdc_field       using 'BDC_CURSOR'
                              'MARA-MEINS'.
perform bdc_field       using 'MARA-MEINS'
                              record-MEINS_007.
perform bdc_dynpro      using 'SAPLMGMM' '4004'.
perform bdc_field       using 'BDC_OKCODE'
                              '/00'.
perform bdc_field       using 'BDC_CURSOR'
                              'MAKT-MAKTX'.
perform bdc_field       using 'MAKT-MAKTX'
                              record-MAKTX_008.
perform bdc_dynpro      using 'SAPLSPO1' '0300'.
perform bdc_field       using 'BDC_OKCODE'
                              '=YES'.
perform bdc_transaction using 'MM01'.

enddo.

perform close_group.
perform close_dataset using dataset.
