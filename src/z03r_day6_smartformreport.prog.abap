*&---------------------------------------------------------------------*
*& Report Z03R_DAY6_SMARTFORMREPORT
*&---------------------------------------------------------------------*
*& by : Subhashini Rawat
*&---------------------------------------------------------------------*
REPORT z03r_day6_smartformreport.
* Table lists we are going to use.
TABLES: ekko, ekpo, mara.

* Defining the structure, internal table structure
TYPES: BEGIN OF ty_header,
         ebeln TYPE ebeln,
         bstyp TYPE ebstyp,
         ekorg TYPE ekorg,
         lifnr TYPE elifn,
         bedat TYPE ebdat,
         ernam TYPE ernam,

       END OF ty_header,


       BEGIN OF ty_line,
         ebeln TYPE ebeln,
         ebelp TYPE ebelp,
         matnr TYPE matnr,
         werks TYPE ewerk,
         menge TYPE bstmg,
         meins TYPE bstme,
       END OF ty_line.

* Data objects, interbal tables and work areas
DATA: wa_header TYPE ty_header,
      it_header TYPE TABLE OF ty_header,
      wa_line   TYPE ty_line,
      it_line   TYPE TABLE OF ty_line,
      fm_name   TYPE rs38l_fnam.

* screen input
PARAMETERS p_ebeln TYPE ekko-ebeln OBLIGATORY.
SELECT-OPTIONS: s_matnr FOR ekpo-matnr OBLIGATORY.


* Top Of Page
TOP-OF-PAGE.

* Start of selection event, fetching data
START-OF-SELECTION.

  SELECT ebeln bstyp ekorg lifnr bedat ernam
*    ekpo~ebeln ekpo~ebelp ekpo~matnr ekpo~werks ekpo~menge ekpo~meins
     FROM ekko INTO TABLE it_header WHERE ebeln = p_ebeln.
  IF sy-subrc NE 0.
    MESSAGE 'Data could not be fetched from the table ekko.' TYPE 'E'.
  ELSE.

    SELECT ebeln ebelp matnr werks menge meins FROM ekpo INTO TABLE it_line FOR ALL ENTRIES IN it_header
      WHERE ebeln = it_header-ebeln AND matnr IN s_matnr .
    IF sy-subrc NE 0.
      MESSAGE 'Data could not be fetched from the table ekpo.' TYPE 'E'.
    ELSE.
      CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
        EXPORTING
          formname           = 'Z03SF_SMARTFORM'
*         VARIANT            = ' '
*         DIRECT_CALL        = ' '
        IMPORTING
          fm_name            = fm_name
        EXCEPTIONS
          no_form            = 1
          no_function_module = 2
          OTHERS             = 3.
      IF sy-subrc <> 0.
        MESSAGE 'Smart Form could not be generated - Main SSF Function Error' TYPE 'E'.
      ENDIF.


      CALL FUNCTION '/1BCDWB/SF00000029'
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
          litab_header = it_header
          litab_line   = it_line
* EXCEPTIONS
*         FORMATTING_ERROR           = 1
*         INTERNAL_ERROR             = 2
*         SEND_ERROR   = 3
*         USER_CANCELED              = 4
*         OTHERS       = 5
        .
      IF sy-subrc <> 0.
* Implement suitable error handling here
      ENDIF.



*      CALL FUNCTION fm_name
*        TABLES
*          litab_header     = it_header
*          litab_line       = it_line
*        EXCEPTIONS
*          formatting_error = 1
*          internal_error   = 2
*          send_error       = 3
*          user_canceled    = 4
*          OTHERS           = 5.
*
*      IF sy-subrc <> 0.
*        MESSAGE 'Smar Form could not be generated - FUNCTION MODULE' TYPE 'E'.
*      ENDIF.
    ENDIF.

  ENDIF.


END-OF-SELECTION.

* callling smart form module


  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
