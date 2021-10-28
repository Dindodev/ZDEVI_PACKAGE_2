*&---------------------------------------------------------------------*
*& Report Z05R_SMARTFORM_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z05R_SMARTFORM_PROGRAM.



TABLES: ekko, ekpo.



TYPES: BEGIN OF itab_ekko,
         ebeln TYPE ekko-ebeln,
         bstyp TYPE ekko-bstyp,
         ekorg TYPE ekko-ekorg,
         lifnr TYPE ekko-lifnr,
         bedat TYPE ekko-bedat,
         ernam TYPE ekko-ernam,


       END OF itab_ekko.


TYPES: BEGIN OF itab_ekpo,
         ebeln TYPE ekpo-ebeln,
         ebelp TYPE ekpo-ebelp,
         matnr TYPE ekpo-matnr,
         werks TYPE ekpo-werks,
         menge TYPE ekpo-menge,
         meins TYPE ekpo-meins,


       END OF itab_ekpo.





DATA: wa_ekko TYPE itab_ekko,
      it_ekko TYPE STANDARD TABLE OF itab_ekko,
      wa_ekpo TYPE itab_ekpo,
      it_ekpo TYPE STANDARD TABLE OF itab_ekpo.


PARAMETERS: p_ebeln TYPE ekko-ebeln.
SELECT-OPTIONS: s_matnr FOR ekpo-matnr.

START-OF-SELECTION.

SELECT ebeln bstyp ekorg lifnr bedat ernam FROM ekko INTO TABLE it_ekko WHERE

  ebeln = p_ebeln.

IF it_ekko IS NOT INITIAL.

  SELECT ebeln ebelp matnr werks menge meins FROM ekpo INTO TABLE it_ekpo
    FOR ALL ENTRIES IN it_ekko
    WHERE ebeln = it_ekko-ebeln AND matnr IN s_matnr.
IF SY-SUBRC = 0.

  DATA: LV_FNAME TYPE rs38l_fnam.

  CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
    EXPORTING
      formname                 ='Z05_SF_EX1'
*     VARIANT                  = ' '
*     DIRECT_CALL              = ' '
   IMPORTING
     FM_NAME                  = LV_FNAME
   EXCEPTIONS
     NO_FORM                  = 1
     NO_FUNCTION_MODULE       = 2
     OTHERS                   = 3
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


CALL FUNCTION LV_FNAME
* EXPORTING
*   ARCHIVE_INDEX              =
*   ARCHIVE_INDEX_TAB          =
*   ARCHIVE_PARAMETERS         =
*   CONTROL_PARAMETERS         =
*   MAIL_APPL_OBJ              =
*   MAIL_RECIPIENT             =
*   MAIL_SENDER                =
*   OUTPUT_OPTIONS             =
*   USER_SETTINGS              = 'X'
* IMPORTING
*   DOCUMENT_OUTPUT_INFO       =
*   JOB_OUTPUT_INFO            =
*   JOB_OUTPUT_OPTIONS         =
  TABLES
    it_header                  = IT_EKKO
    it_item                    = IT_EKPO
 EXCEPTIONS
   FORMATTING_ERROR           = 1
   INTERNAL_ERROR             = 2
   SEND_ERROR                 = 3
   USER_CANCELED              = 4
   OTHERS                     = 5
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.


ENDIF.

ENDIF.
