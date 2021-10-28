*&---------------------------------------------------------------------*
*& Report Z11R_SMARTFORM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z11r_smartform.


TABLES : ekko,ekpo.

TYPES : BEGIN OF ty_ekko,
          ebeln TYPE ekko-ebeln,
          bstyp TYPE ekko-bstyp,
          ekorg TYPE ekko-ekorg,
          lifnr TYPE ekko-lifnr,
          bedat TYPE ekko-bedat,
          ernam TYPE ekko-ernam,
        END OF ty_ekko,

        BEGIN OF ty_ekpo,
          ebeln TYPE  ekpo-ebeln,
          ebelp TYPE  ekpo-ebelp,
          matnr TYPE  ekpo-matnr,
          werks TYPE ekpo-werks,
          menge TYPE ekpo-menge,
          meins TYPE ekpo-meins,
        END OF ty_ekpo.

DATA : lt_ekko TYPE TABLE OF ty_ekko,
       ls_ekko TYPE ty_ekko,
       lt_ekpo TYPE TABLE OF ty_ekpo,
       ls_ekpo TYPE ty_ekpo.

PARAMETERS p_pono TYPE ekko-ebeln.
SELECT-OPTIONS s_matno FOR ekpo-matnr.

START-OF-SELECTION.

  SELECT ebeln bstyp ekorg lifnr bedat ernam FROM ekko INTO TABLE lt_ekko WHERE ebeln = p_pono.
  IF sy-subrc = 0.
    IF lt_ekko is NOT INITIAL.


    SELECT ebeln ebelp matnr matnr menge  meins FROM ekpo INTO TABLE lt_ekpo FOR ALL ENTRIES IN lt_ekko WHERE ebeln = lt_ekko-ebeln and matnr in s_matno.
        IF sy-subrc = 0.


        DATA: lv_fname TYPE rs38l_fnam.

        CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
          EXPORTING
            formname                 = 'Z11SF_FIRSTSMARTFORM'
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
        it_header                  = lt_ekko
        it_item                    = lt_ekpo
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
