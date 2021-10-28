*&---------------------------------------------------------------------*
*& Report Z03R_SEND_IDOC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03r_send_idoc.
* selection parameter
PARAMETERS : p_no LIKE z03t_employee-empno.
* IDOC related data declaration
DATA : gen_segment LIKE edidd-segnam VALUE 'Z03_SEGMENT'.
DATA : control_dat LIKE edidc,
       gen_data    LIKE z03_segment.
* tables to be used
TABLES :z03t_employee.


DATA :
  int_edidd LIKE edidd OCCURS 0 WITH HEADER LINE,
  int_edidc LIKE edidc OCCURS 0 WITH HEADER LINE.

SELECT empno FROM z03t_employee INTO TABLE @DATA(it_emp).
IF sy-subrc NE 0.
  MESSAGE 'no data' TYPE 'I'.
  EXIT.
ENDIF.
control_dat-mestyp = 'Z03_MTYPE'.
control_dat-idoctp = 'Z03_IDOC_TYPE'.
control_dat-rcvprt = 'LS'.
control_dat-rcvprn =  p_no.

LOOP AT it_emp ASSIGNING FIELD-SYMBOL(<lfs_emp>).
  gen_data-empno = <lfs_emp>-empno.
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
