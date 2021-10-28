*&---------------------------------------------------------------------*
*& Report Z04R_DEMO_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z04R_DEMO_PROGRAM.

*Types ty_variable(3) TYPE C.
*data iv_variable TYPE ty_variable.
*iv_variable = 123.
*write iv_variable.

TYPES : BEGIN OF ty_structure,
  empid TYPE i,
  empname TYPE ZEMPNAME,
  companycode TYPE BKPF-BUKRS,
  END OF ty_structure.


  data: It_table TYPE TABLE OF ty_structure,
        Is_structure TYPE ty_structure.

  Is_structure-empid = 1.
  Is_structure-empname = "Pragna".
  Is_structure-companycode = 1000.
  append Is_structure to it_table.

  CLEAR Is_structure.


   Is_structure-empid = 2.
  Is_structure-empname = "Nikitha".
  Is_structure-companycode = 2000.
    append Is_structure to it_table.

  CLEAR Is_structure.

TABLES : bkpf.

  CONSTANTS: Ic_con TYPE bkpf-bukrs VALUE '1000'.
  PARAMETERS : p_bukrs TYPE bkpf-bukrs OBLIGATORY.
  select-OPTIONS : s_bukrs for bkpf-bukrs.
