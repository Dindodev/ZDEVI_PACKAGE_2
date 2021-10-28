*&---------------------------------------------------------------------*
*& Report Z01SF_DRIVER_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01sf_driver_program.
TABLES: ekpo,ekko.

PARAMETERS: p_po TYPE ebeln.
SELECT-OPTIONS: s_matnr FOR ekpo-matnr.




DATA: lt_header type z01tty_head,
      wa_ekko type z01st_head,
      lt_item type z01tty_item,
      wa_ekpo type z01st_item.

START-OF-SELECTION.
  "select details from po header table
  SELECT ebeln bstyp ekorg lifnr bedat ernam FROM ekko INTO TABLE lt_header WHERE ebeln = p_po.
  IF sy-subrc = 0.

    IF lt_header IS NOT INITIAL.
      SELECT ebeln ebelp matnr werks menge meins FROM ekpo INTO TABLE lt_item FOR ALL ENTRIES IN lt_header WHERE ebeln = lt_header-ebeln AND matnr IN s_matnr.
      IF sy-subrc = 0.


        DATA: fname TYPE rs38l_fnam.

        CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
          EXPORTING
            formname = 'Z01SF_SMARTFORM'
*           VARIANT  = ' '
*           DIRECT_CALL              = ' '
          IMPORTING
            fm_name  = fname
*         EXCEPTIONS
*           NO_FORM  = 1
*           NO_FUNCTION_MODULE       = 2
*           OTHERS   = 3
          .
        IF sy-subrc <> 0.
* Implement suitable error handling here
        ENDIF.


        CALL FUNCTION fname
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
            it_header = lt_header
            it_item   = lt_item
*     EXCEPTIONS
*           FORMATTING_ERROR           = 1
*           INTERNAL_ERROR             = 2
*           SEND_ERROR                 = 3
*           USER_CANCELED              = 4
*           OTHERS    = 5
          .
        IF sy-subrc <> 0.
* Implement suitable error handling here
        ENDIF.


      ENDIF.
    ENDIF.


  ENDIF.
