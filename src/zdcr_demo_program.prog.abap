*&---------------------------------------------------------------------*
*& Report ZDCR_DEMO_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDCR_DEMO_PROGRAM.

*Types ty_variable(3) TYPE c.
*
*
*data lv_variable TYPE ty_variable.

TYPES : BEGIN OF ty_structure.
  empid type i,
  empname TYPE Z02DE_EMPNAME,
  compantcode TYPE bkpf-bukrs,
  END OF ty_structure.


  DATA : lt_table TYPE TABLE OF ty_structure,
        ls_structure TYPE ty_structure.



  ls_structure-empid = 530.
  ls_structure-empname = 'AB'.
  ls_structure-companycode = 1000.

  APPEND ls_structure TO lt_table.


  ls_structure-empid = 531.
  ls_structure-empname = 'AC'.
  ls_structure-companycode = 2000.

*  APPEND ls_structure TO lt_table.
*
*  CLEAR ls_structure.
TABLES : bkpf.
  CONSTANTS : lc_con TYPE bkpf-bukrs VALUE '1000'.

  PARAMETERS : p_bukrs TYPE bkpf-bukrs OBLIGATORY.

  select-OPTIONS : s_bukrs for bkpf-bukrs.






*lv_variable = 123.
*
