*&---------------------------------------------------------------------*
*& Report Z07R_DEMOPROG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z07r_demoprog.
*Types ty_variable(3) type c.
data lv_variable type string.
lv_variable = text-001.
write lv_variable.

Types: begin of ty_struct,
  blart type bkpf-bukrs,
  bladt type belnr_d,
  gjahr type gjahr,
  end of ty_struct.

  Data : ls_struct type ty_struct,
  ls_bkpf type bkpf.

  ls_struct-blart = '1000'.
  ls_struct-bladt = '234577'.
  ls_struct-gjahr ='2018'.

  move-corresponding ls_struct to ls_bkpf.
  clear ls_bkpf.


*TYPES : BEGIN OF ty_structure,
*          empid       TYPE i,
*          empname     TYPE z07de_empname,
*          companycode TYPE bkpf-bukrs,
*
*        END OF  ty_structure.
*
*Tables: bkpf.
*DATA :lt_table     TYPE TABLE OF ty_structure,
*      ls_structure TYPE ty_structure.
*CONSTANTS: lc_con TYPE bkpf-bukrs VALUE '1000'.
*PARAMETERS: p_bukrs TYPE bkpf-bukrs obligatory.
*select-options : s_bukrs for bkpf-bukrs.
*
*ls_structure-empid = 1.
*ls_structure-empname = 'Nikita'.
*ls_structure-companycode = 1000.
*
*
*append ls_structure TO lt_table.
*CLEAR ls_structure.
*
*ls_structure-empid = 2.
*ls_structure-empname = 'Nithin'.
*ls_structure-companycode = 2000.
*
*APPEND ls_structure TO lt_table.
*CLEAR ls_structure.

*
*lv_variable = 1.
*write lv_var iable.
