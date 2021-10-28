*&---------------------------------------------------------------------*
*& Report Z10SF_SMARTFORMDRIVER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z10sf_smartformdriver.

TABLES ekpo.

PARAMETERS : p_ebeln TYPE ebeln.
SELECT-OPTIONS : s_matnr FOR ekpo-matnr.

TYPES : BEGIN OF ty_ekko_head,
          ebeln TYPE ebeln,
          bstyp TYPE ebstyp,
          ekorg TYPE ekorg,
          lifnr TYPE elifn,
          bedat TYPE ebdat,
          ernam TYPE ernam,
        END OF ty_ekko_head.

TYPES : BEGIN OF ty_ekpo_item,
          ebeln TYPE ebeln,
          ebelp TYPE ebelp,
          matnr TYPE matnr,
          werks TYPE ewerk,
          menge TYPE bstmg,
          meins TYPE bstme,
        END OF ty_ekpo_item.

DATA : lt_ekko_head TYPE TABLE OF ty_ekko_head,
       ls_ekko_head TYPE ty_ekko_head,
       lt_ekpo_item TYPE TABLE OF ty_ekpo_item,
       ls_ekpo_item TYPE ty_ekpo_item.

START-OF-SELECTION.

  SELECT ebeln bstyp ekorg lifnr bedat ernam FROM ekko INTO TABLE lt_ekko_head WHERE ebeln = p_ebeln.

  IF sy-subrc = 0.
    IF lt_ekko_head IS NOT INITIAL.
      SELECT ebeln ebelp matnr werks menge meins FROM ekpo INTO TABLE lt_ekpo_item FOR ALL ENTRIES IN lt_ekko_head
        WHERE ebeln = lt_ekko_head-ebeln AND matnr IN s_matnr.
    ENDIF.
  ENDIF.

  DATA : lv_fname TYPE rs38l_fnam.

  CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
    EXPORTING
      formname = 'Z10SF_SMARTFORM'
*     VARIANT  = ' '
*     DIRECT_CALL              = ' '
    IMPORTING
      fm_name  = lv_fname
*                   EXCEPTIONS
*     NO_FORM  = 1
*     NO_FUNCTION_MODULE       = 2
*     OTHERS   = 3
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


  CALL FUNCTION '/1BCDWB/SF00000039'
*   EXPORTING
*     ARCHIVE_INDEX              =
*     ARCHIVE_INDEX_TAB          =
*     ARCHIVE_PARAMETERS         =
*     CONTROL_PARAMETERS         =
*     MAIL_APPL_OBJ              =
*     MAIL_RECIPIENT             =
*     MAIL_SENDER                =
*     OUTPUT_OPTIONS             =
*     USER_SETTINGS              = 'X'
*   IMPORTING
*     DOCUMENT_OUTPUT_INFO       =
*     JOB_OUTPUT_INFO            =
*     JOB_OUTPUT_OPTIONS         =
    TABLES
      it_header                  = lt_ekko_head
      it_item                    = lt_ekpo_item
*   EXCEPTIONS
*     FORMATTING_ERROR           = 1
*     INTERNAL_ERROR             = 2
*     SEND_ERROR                 = 3
*     USER_CANCELED              = 4
*     OTHERS                     = 5
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
