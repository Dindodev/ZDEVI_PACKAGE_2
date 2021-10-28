*&---------------------------------------------------------------------*
*& Report Z05R_DEMO_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z05R_DEMO_PROGRAM.

*TYPES ty_variable(3) TYPE c.
*lv_variable = 123. write lv_variable.


data lv_variable TYPE string.
lv_variable = text-001.
 write lv_variable.
TABLES : bkpf.
*TYPES : BEGIN OF ty_structure,
*  empid type i,
*  empname type Z05TT_table,
*  empname1 type Z05T_EMP-EMPNAME,
*  companycode type bkpf-bukrs,
*
* END OF ty_structure.
*
*data : lt_table type TABLE OF ty_structure,
*      ls_structure TYPE ty_structure.
*CONSTANTS : lt_con TYPE bkpf-bukrs VALUE '1001'.
*PARAMETERS : p_bukrs TYPE bkpf-bukrs OBLIGATORY DEFAULT '1000'.
*SELECT-OPTIONS : s_bukrs for bkpf-bukrs.
*ls_structure-empid = 1.
*ls_structure-empname = 'Yuvashree'.
*ls_structure-empname1 = 'Ramesh'.
*ls_structure-companycode = 1000.

*APPEND ls_structure to lt_table.
*CLEAR ls_structure.
*ls_structure-empid = 2.
*ls_structure-empname = 'Tony'.
*ls_structure-empname1 = 'Stark'.
*ls_structure-companycode = 1001.

*APPEND ls_structure to lt_table.

TYPES : BEGIN OF ty_structure,
  blart type bkpf-bukrs,
 bldat type belnr_d,
  gjahr type bkpf-gjahr,

 END OF ty_structure.

 data : ls_structure type ty_structure,
       ls_bkpf type bkpf.

 ls_structure-blart = '1000'.
 ls_structure-bldat = '2345'.
 ls_structure-gjahr = '2018'.

 move-CORRESPONDING  ls_structure to ls_bkpf.
 clear ls_structure.
