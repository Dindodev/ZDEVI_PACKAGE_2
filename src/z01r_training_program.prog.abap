*&---------------------------------------------------------------------*
*& Report Z01R_TRAINING_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01R_TRAINING_PROGRAM.

*Types ty_variable(3) TYPE c.
*
*data lv_variable TYPE ty_variable.
*
*lv_variable = 123.
*
* write lv_variable.

*TYPES : BEGIN OF ty_structure,
*
*  empid TYPE i,
*  empname TYPE  Z01T_EMPMASTER,
*  empname_DE TYPE Z01DE_EMPNAME,
*  companycode TYPE bkpf-bukrs,
*
*
*end OF ty_structure.
*
*
*data: lt_table TYPE TABLE OF ty_structure,
*      ls_structure TYPE ty_structure.
*
*      ls_structure-empid = 1.
*      ls_structure-empname = 'Pruthvi'.
*      ls_structure-companycode = 1000.
*
*
*      APPEND ls_structure to lt_table.
*
*       ls_structure-empid = 2.
*      ls_structure-empname = 'Ruthvi'.
*      ls_structure-companycode = 2000.
*
*      APPEND ls_structure to lt_table.
*
*      clear ls_structure.

      TYPES : BEGIN OF ty_structure,

  bukrs TYPE bkpf-bukrs,
   BLDAT TYPE belnr_d,
   qjahr TYPE gjahr,

end OF ty_structure.

      DATA : ls_structure TYPE ty_structure,
             ls_bkpf   TYPE bkpf.

ls_structure-bukrs = '1000'.
ls_structure-BLDAT = '234577'.
ls_structure-qjahr = '2018'.


      MOVE-CORRESPONDING ls_structure to ls_bkpf.
       clear ls_structure.
