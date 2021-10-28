*&---------------------------------------------------------------------*
*& Report Z03R_SEND_IDOC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z07_send_idoc.
* selection parameter
PARAMETERS : lv_matnr LIKE mara-Matnr .
* IDOC related data declaration
DATA : gen_segment LIKE edidd-segnam VALUE 'Z07_SEG'.
DATA : control_dat LIKE edidc,
       gen_data    LIKE z07_seg.
* tables to be used
TABLES :Mara.


DATA :
  int_edidd LIKE edidd OCCURS 0 WITH HEADER LINE,
  int_edidc LIKE edidc OCCURS 0 WITH HEADER LINE.

SELECT matnr FROM mara INTO TABLE @DATA(it_emp).
IF sy-subrc NE 0.
  MESSAGE 'no data' TYPE 'I'.
  EXIT.
ENDIF.
control_dat-mestyp = 'Z07_msg'.
control_dat-idoctp = 'Z07_IDOC'.
control_dat-rcvprt = 'LS'.
control_dat-rcvprn =  lv_matnr.

LOOP AT it_emp ASSIGNING FIELD-SYMBOL(<lfs_emp>).
  gen_data-matnr = <lfs_emp>-matnr.
  int_edidd-segnam = gen_segment.
  int_edidd-sdata = gen_data.
  APPEND int_edidd.
ENDLOOP.
CALL FUNCTION 'MASTER_IDOC_DISTRIBUTE'
  EXPORTING
    master_idoc_control            = control_dat
  TABLES
    communication_idoc_control     = int_edidc
    master_idoc_data               = int_edidd
  EXCEPTIONS
    error_in_idoc_control          = 1
    error_writing_idoc_status      = 2
    error_in_idoc_data             = 3
    sending_logical_system_unknown = 4
    OTHERS                         = 5.
IF sy-subrc <> 0.
  MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno.
ELSE.
  LOOP AT int_edidc.
    WRITE :/ 'IDOC GENERATED',int_edidc-docnum.
  ENDLOOP.
  COMMIT WORK.
ENDIF.
