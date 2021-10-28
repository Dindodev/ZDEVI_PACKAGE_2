*&---------------------------------------------------------------------*
*& Report Z08R_DEMO_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z08R_DEMO_PROGRAM.

*Types ty_variable(3) TYPE c.
*
*data iv_variable TYPE ty_variable.
*
*iv_variable = 112.
*write iv_variable.

TYPES : BEGIN OF ty_structure,
 empid TYPE i,
 empname TYPE Z08DE_EMP_NAME,
 companycode TYPE bkpf-bukrs,
  END OF ty_structure.

  data : lt_table TYPE TABLE OF ty_structure,
         ls_structure TYPE ty_structure.

  ls_structure-empid = 1.
  ls_structure-empname = 'Sarvotham'.
  ls_structure-companycode = 1000.
  APPEND ls_structure to lt_table.

  CLEAR ls_structure.

  ls_structure-empid = 2.
  ls_structure-empname = 'abc'.
  ls_structure-companycode = 1000.
  APPEND ls_structure to lt_table.

  CLEAR ls_structure.

  TABLES : bkpf.

  CONSTANTS : ic_con TYPE bkpf-bukrs VALUE '1000'.
  PARAMETERS : p_bukrs TYPE bkpf-bukrs OBLIGATORY.
  select-OPTIONS : s_bukrs for bkpf-bukrs.
