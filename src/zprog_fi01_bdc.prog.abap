REPORT zprog_fi01_bdc
       NO STANDARD PAGE HEADING LINE-SIZE 255.

* Include bdcrecx1_s:
* The call transaction using is called WITH AUTHORITY-CHECK!
* If you have own auth.-checks you can use include bdcrecx1 instead.
INCLUDE bdcrecx1_s.

PARAMETERS: dataset(132) LOWER CASE.
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

DATA: BEGIN OF record,
* data element: BANKS
        banks_001(003),
* data element: BANKK
        bankl_002(015),
* data element: BANKA
        banka_003(060),
* data element: REGIO
        provz_004(003),
* data element: STRAS_GP
        stras_005(035),
* data element: ORT01_GP
        ort01_006(035),
* data element: BRNCH
        brnch_007(040),
      END OF record.
DATA: lt_record TYPE STANDARD TABLE OF record.
*** End generated data section ***

START-OF-SELECTION.

  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      filename            = 'C:\Users\sbhati002\Desktop\BANK.csv'
      filetype            = 'ASC'
      has_field_separator = ','
    TABLES
      data_tab            = lt_record.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
PERFORM open_group.
*do.
  LOOP AT lt_record INTO record.
    SPLIT record   AT ',' INTO  record-banks_001
* data element: BANKK
         record-bankl_002
* data element: BANKA
         record-banka_003
* data element: REGIO
         record-provz_004
* data element: STRAS_GP
         record-stras_005
* data element: ORT01_GP
         record-ort01_006
* data element: BRNCH
         record-brnch_007.
*read dataset dataset into record.
    IF sy-subrc <> 0. EXIT. ENDIF.

    PERFORM bdc_dynpro      USING 'SAPMF02B' '0100'.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'BNKA-BANKL'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '/00'.
    PERFORM bdc_field       USING 'BNKA-BANKS'
                                  record-banks_001.
    PERFORM bdc_field       USING 'BNKA-BANKL'
                                  record-bankl_002.
    PERFORM bdc_dynpro      USING 'SAPMF02B' '0110'.
    PERFORM bdc_field       USING 'BDC_CURSOR'
                                  'BNKA-BRNCH'.
    PERFORM bdc_field       USING 'BDC_OKCODE'
                                  '=UPDA'.
    PERFORM bdc_field       USING 'BNKA-BANKA'
                                  record-banka_003.
    PERFORM bdc_field       USING 'BNKA-PROVZ'
                                  record-provz_004.
    PERFORM bdc_field       USING 'BNKA-STRAS'
                                  record-stras_005.
    PERFORM bdc_field       USING 'BNKA-ORT01'
                                  record-ort01_006.
    PERFORM bdc_field       USING 'BNKA-BRNCH'
                                  record-brnch_007.
    PERFORM bdc_transaction USING 'FI01'.
  ENDLOOP.


*enddo.

perform close_group.
*perform close_dataset using dataset.
