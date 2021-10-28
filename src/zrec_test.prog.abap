report ZREC_TEST
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
* data element: BANKS
        BANKS_001(003),
* data element: BANKK
        BANKL_002(015),
* data element: BANKA
        BANKA_003(060),
* data element: REGIO
        PROVZ_004(003),
* data element: STRAS_GP
        STRAS_005(035),
* data element: ORT01_GP
        ORT01_006(035),
* data element: BRNCH
        BRNCH_007(040),
      end of record.

*** End generated data section ***

start-of-selection.

perform open_dataset using dataset.
perform open_group.

do.

read dataset dataset into record.
if sy-subrc <> 0. exit. endif.

perform bdc_dynpro      using 'SAPMF02B' '0100'.
perform bdc_field       using 'BDC_CURSOR'
                              'BNKA-BANKL'.
perform bdc_field       using 'BDC_OKCODE'
                              '/00'.
perform bdc_field       using 'BNKA-BANKS'
                              record-BANKS_001.
perform bdc_field       using 'BNKA-BANKL'
                              record-BANKL_002.
perform bdc_dynpro      using 'SAPMF02B' '0110'.
perform bdc_field       using 'BDC_CURSOR'
                              'BNKA-BRNCH'.
perform bdc_field       using 'BDC_OKCODE'
                              '=UPDA'.
perform bdc_field       using 'BNKA-BANKA'
                              record-BANKA_003.
perform bdc_field       using 'BNKA-PROVZ'
                              record-PROVZ_004.
perform bdc_field       using 'BNKA-STRAS'
                              record-STRAS_005.
perform bdc_field       using 'BNKA-ORT01'
                              record-ORT01_006.
perform bdc_field       using 'BNKA-BRNCH'
                              record-BRNCH_007.
perform bdc_transaction using 'FI01'.

enddo.

perform close_group.
perform close_dataset using dataset.
