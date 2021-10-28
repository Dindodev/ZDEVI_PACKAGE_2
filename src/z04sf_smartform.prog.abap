*&---------------------------------------------------------------------*
*& Report Z04SF_SMARTFORM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04sf_smartform.

TABLES:ekko,
       ekpo.

SELECT-OPTIONS:s_mat FOR ekpo-matnr.
PARAMETERS : p_mtype TYPE ekko-ebeln.


TYPES: BEGIN OF ty_ekko,
         ebeln TYPE ekko-ebeln,
         bstyp  TYPE ekko-bstyp,
         ekorg   TYPE ekko-ekorg,
         lifnr   TYPE ekko-lifnr,
         bedat TYPE ekko-bedat,
         ernam  TYPE ekko-ernam,

       END OF ty_ekko.

TYPES: BEGIN OF ty_ekpo,
         ebeln TYPE ekpo-ebeln,
         ebelp TYPE ekpo-ebelp,
         matnr TYPE ekpo-matnr,
         werks TYPE ekpo-werks,
         menge  TYPE ekpo-menge,
       meins  TYPE ekpo-meins,

       END OF ty_ekpo.



DATA : it_ekko TYPE TABLE OF ty_ekko,
       lw_ekko TYPE ty_ekko.

DATA : it_ekpo  TYPE TABLE OF ty_ekpo,
       fin_ekpo TYPE TABLE OF ty_ekpo,
       lw_ekpo  TYPE ty_ekpo.

START-OF-SELECTION.


  SELECT ebeln bstyp ekorg lifnr bedat ernam  FROM ekko INTO TABLE it_ekko WHERE ebeln EQ p_mtype.


  IF it_ekko[] IS NOT INITIAL.
    MESSAGE 'Success!'  Type 'S'.
    SELECT ebeln ebelp matnr werks menge meins
      FROM ekpo INTO TABLE  it_ekpo
      FOR ALL ENTRIES IN it_ekko WHERE ebeln  = it_ekko-ebeln AND matnr in s_mat.

  ENDIF.

  DATA:
fname TYPE rs38l_fnam.


  CALL FUNCTION '/1BCDWB/SF00000031'
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
