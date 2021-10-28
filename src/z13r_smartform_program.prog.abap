*&---------------------------------------------------------------------*
*& Report Z13R_SMARTFORM_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z13r_smartform_program.



TABLES: ekpo,mara.

PARAMETERS: p_po TYPE ebeln.
SELECT-OPTIONS: s_matnr FOR ekpo-matnr.


TYPES: BEGIN OF l_ty_header,
         ebeln TYPE ebeln,
         bstyp TYPE ebstyp,
         ekorg TYPE ekorg,
         lifnr TYPE elifn,
         bedat TYPE ebdat,
         ernam TYPE ernam,
       END OF l_ty_header.


TYPES: BEGIN OF l_ty_item,
         ebeln TYPE ebeln,
         ebelp TYPE ebelp,
         matnr TYPE matnr,
         werks TYPE ewerk,
         menge TYPE bstmg,
         meins TYPE bstme,
       END OF l_ty_item.

DATA: lt_header TYPE TABLE OF l_ty_header,
      lt_item   TYPE TABLE OF l_ty_item,
      ls_header TYPE l_ty_header,
      ls_item   TYPE l_ty_item.


START-OF-SELECTION.
  "select details from po header table
  SELECT ebeln bstyp ekorg lifnr bedat ernam FROM ekko INTO TABLE lt_header WHERE ebeln = p_po.
  IF sy-subrc = 0.

    IF lt_header is NOT INITIAL.
      SELECT ebeln ebelp matnr werks menge meins FROM ekpo INTO TABLE lt_item FOR ALL ENTRIES IN lt_header WHERE ebeln = lt_header-ebeln and matnr in s_matnr.
      IF sy-subrc = 0.


        DATA: lv_fname TYPE rs38l_fnam.

        CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
          EXPORTING
            formname                 = 'Z13SF_POFORM'
*           VARIANT                  = ' '
*           DIRECT_CALL              = ' '
         IMPORTING
           FM_NAME                  = lv_fname
*         EXCEPTIONS
*           NO_FORM                  = 1
*           NO_FUNCTION_MODULE       = 2
*           OTHERS                   = 3
                  .
        IF sy-subrc <> 0.
* Implement suitable error handling here
        ENDIF.


    CALL FUNCTION lv_fname
*     EXPORTING
*       ARCHIVE_INDEX              =
*       ARCHIVE_INDEX_TAB          =
*       ARCHIVE_PARAMETERS         =
*       CONTROL_PARAMETERS         =
*       MAIL_APPL_OBJ              =
*       MAIL_RECIPIENT             =
*       MAIL_SENDER                =
*       OUTPUT_OPTIONS             =
*       USER_SETTINGS              = 'X'
*     IMPORTING
*       DOCUMENT_OUTPUT_INFO       =
*       JOB_OUTPUT_INFO            =
*       JOB_OUTPUT_OPTIONS         =
      TABLES
        it_header                  = lt_header
        it_item                    = lt_item
*     EXCEPTIONS
*       FORMATTING_ERROR           = 1
*       INTERNAL_ERROR             = 2
*       SEND_ERROR                 = 3
*       USER_CANCELED              = 4
*       OTHERS                     = 5
              .
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.







      ENDIF.
    ENDIF.


  ENDIF.
