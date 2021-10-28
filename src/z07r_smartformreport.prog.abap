*&---------------------------------------------------------------------*
*& Report Z07R_SMARTFORMREPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z07r_smartformreport.
TABLES : ekko,ekpo.


SELECT-OPTIONS : ebeln FOR ekko-ebeln,
matnr FOR ekpo-matnr.

TYPES : BEGIN OF ls_ekko,
          ebeln TYPE ekko-ebeln,
          bstyp TYPE ekko-bstyp,
          ekorg TYPE ekko-ekorg,
          lifnr TYPE ekko-lifnr,
          bedat TYPE ekko-bedat,
          ernam TYPE ekko-ernam,
        END OF ls_ekko.
TYPES: BEGIN OF ls_ekpo,
         ebeln TYPE ekpo-ebeln,
         ebelp TYPE ekpo-ebelp,
         matnr TYPE ekpo-matnr,
         werks TYPE ekpo-werks,
         menge TYPE ekpo-menge,
         meins TYPE ekpo-meins,
       END OF  ls_ekpo.

DATA: it_ekko TYPE ztt07_ekko,
      wa_ekko TYPE zst07_ekko1,
      wa_ekpo TYPE zst07_ekpo1,
      it_ekpo TYPE ztt07_ekpo.

DATA : lv_fm_num TYPE rs38l_fnam.

SELECT ebeln bstyp ekorg lifnr bedat ernam FROM ekko  INTO TABLE it_ekko WHERE ebeln IN ebeln.

IF it_ekko IS NOT INITIAL.
  SELECT ebeln ebelp matnr werks menge meins FROM ekpo INTO TABLE it_ekpo FOR ALL ENTRIES IN it_ekko
    WHERE ebeln EQ it_ekko-ebeln  AND matnr IN matnr.
  IF sy-subrc = 0.

    SORT it_ekpo BY ebeln ebelp.
  ENDIF.






ENDIF.

CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
  EXPORTING
    formname           = 'Z07SF_SMARTFORM'
*   VARIANT            = ' '
*   DIRECT_CALL        = ' '
  IMPORTING
    fm_name            = lv_fm_num
  EXCEPTIONS
    no_form            = 1
    no_function_module = 2
    OTHERS             = 3.
IF sy-subrc <> 0.
  WRITE:/ 'Error 1'.
ENDIF.
* Variable Declaration


CALL FUNCTION '/1BCDWB/SF00000027'
*                                                    EXPORTING
*                                                      ARCHIVE_INDEX              =
*                                                      ARCHIVE_INDEX_TAB          =
*                                                      ARCHIVE_PARAMETERS         =
*                                                      CONTROL_PARAMETERS         =
*                                                      MAIL_APPL_OBJ              =
*                                                      MAIL_RECIPIENT             =
*                                                      MAIL_SENDER                =
*                                                      OUTPUT_OPTIONS             =
*                                                      USER_SETTINGS              = 'X'
*                                                      MATNR                      =
*                                                      TEST2                      =
  TABLES
GT_EKKO = it_ekko
GT_EKPO = it_ekpo

*                                                    IMPORTING
*   DOCUMENT_OUTPUT_INFO       =
*   JOB_OUTPUT_INFO            =
*   JOB_OUTPUT_OPTIONS         =
*                                                    EXCEPTIONS
*   FORMATTING_ERROR           = 1
*   INTERNAL_ERROR             = 2
*   SEND_ERROR                 = 3
*   USER_CANCELED              = 4
*   OTHERS  = 5
.
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
