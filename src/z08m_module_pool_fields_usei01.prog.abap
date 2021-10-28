*----------------------------------------------------------------------*
***INCLUDE Z08M_MODULE_POOL_FIELDS_USEI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  F4FORMTRAT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE f4formtrat INPUT.

 DATA: progname TYPE sy-repid,
       dynnum TYPE sy-dynnr,
       it_doc1 TYPE TABLE OF bkpf,
       lv_bukrs TYPE bukrs VALUE '1710'.

   data: begin of dynpfields occurs 3.
     include structure dynpread.
       data: end of dynpfields.


  progname = sy-repid.
dynnum = sy-dynnr.
*CLEAR: field_value, dynpro_values.
*field_value-fieldname = 'TXT_CODCO'.
*APPEND field_value TO dynpro_values.



CALL FUNCTION 'F4IF_FIELD_VALUE_REQUEST'
EXPORTING
tabname = 'BKPF'
fieldname = 'BUKRS'
dynpprog = progname
dynpnr = dynnum
dynprofield = 'TXT_CODCO'.


*CALL FUNCTION 'DYNP_VALUES_READ'
*EXPORTING
*dyname = progname
*dynumb = dynnum
*translate_to_upper = 'X'
*TABLES
*dynpfields = dynpfields.
*
*READ TABLE dynpfields INDEX 1 INTO .
*
*SELECT BUKRS BELNR
*FROM BKPF
*INTO CORRESPONDING FIELDS OF TABLE it_doc1
*WHERE BUKRS = lv_bukrs.
*
*
*
*CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
*EXPORTING
*retfield = 'BELNR'
*dynpprog = progname
*dynpnr = dynnum
*dynprofield = 'TXT_BELNR'
*value_org = 'S'
*TABLES
*value_tab = it_doc1.

ENDMODULE.
