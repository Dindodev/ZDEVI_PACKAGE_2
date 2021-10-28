*&---------------------------------------------------------------------*
*& Report Z03R_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03R_REPORT.


*types ty_variable(3) type c.
*data lv_variable type  ty_variable.
*
*lv_variable = 1.
* WRITE lv_variable.

TYPES : BEGIN OF TY_STRUCTURE,    "CHAIN OPERATOR

  EMPID TYPE I,
  EMPNAME TYPE Z03T_EMPLOYEE-EMPNAME,       "FROM THE TABLE FIELD
  EMPNAME_DE TYPE Z03DE_EMP_NAME,           "FROM DATA ELEMENT
  COMPANYCODE TYPE BKPF-BUKRS,

END OF TY_STRUCTURE.

"DATA

DATA : LT_TABLE TYPE TABLE OF TY_STRUCTURE,   "LOCAL (INTERNAL)IN PROGRAM
       LS_STRUCTURE TYPE TY_STRUCTURE.       "STRUCTURE

LS_STRUCTURE-EMPID = 1.
LS_STRUCTURE-EMPNAME = 'SUBHASHINI'.
LS_STRUCTURE-EMPNAME_DE = 'RAWAT'.
LS_STRUCTURE-COMPANYCODE = 1000.          " IT WILL BE OVER RIDED IF NO VALUE IS GIVEN, HENCE CLEAR AFTER EACH APPEND

*APPENDING THIS DATA TO THE TABLE
APPEND LS_STRUCTURE TO LT_TABLE.
CLEAR LS_STRUCTURE.

LS_STRUCTURE-EMPID = 2.
LS_STRUCTURE-EMPNAME = 'SAKSHI'.
LS_STRUCTURE-EMPNAME_DE = 'NEGI'.
LS_STRUCTURE-COMPANYCODE = 2000.

APPEND LS_STRUCTURE TO LT_TABLE.
CLEAR LS_STRUCTURE.        "CLEAR THE STRUCTURE VALUES








types: begin of ts_structure,

  blart type bkpf-bukrs,
  bldat type belnr_d,
  gjahr type gjahr,

  end of ts_structure.

  data : lsr_structure type ts_structure,
         lsr_bkpf type bkpf.

  lsr_structure-blart = '1000'.
  lsr_structure-bldat  = '20181010'.
  lsr_structure-gjahr = '10200'.

*move lsr_structure to lsr_bkpf.             "move the structure to lsr_bkpf, all values will be moved to first 3 fields
  move-corresponding lsr_structure to lsr_bkpf.    "move the values according to the fields names
  clear lsr_structure.
