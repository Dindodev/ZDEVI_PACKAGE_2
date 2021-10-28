*&---------------------------------------------------------------------*
*& Report Z00R_DEMO_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00r_demo_program.

*Types ty_variable(3) TYPE c.
*
*
*data lv_variable TYPE string.
**
**
*lv_variable = text-001.
*
*write lv_variable.


*TYPES : BEGIN OF ty_structure,
*
*          empid       TYPE i,
*          empname     TYPE Z00TT_TABLE,
*          companycode TYPE bkpf-bukrs,
*
*        END OF ty_structure.
*
*
*DATA : lt_table     TYPE TABLE OF ty_structure,
*       ls_structure TYPE ty_structure.


*ls_structure-empid = 1.
*ls_structure-empname = 'Santosh'.
*ls_structure-companycode = 1000.
*APPEND ls_structure TO lt_table.
*CLEAR ls_structure.
*
*ls_structure-empid = 2.
*ls_structure-empname = 'Navilesh'.
*ls_structure-companycode = 2000.
*APPEND ls_structure TO lt_table.
*CLEAR ls_structure.

*TABLES : bkpf.
*
*CONSTANTS : lc_con TYPE bkpf-bukrs VALUE '1000'.
*
*
*PARAMETERS : p_bukrs TYPE bkpf-bukrs DEFAULT '1000'.
*
*select-OPTIONS : s_bukrs for bkpf-bukrs

TYPES : BEGIN OF ty_structure,

          blart TYPE bkpf-bukrs,
          bldat TYPE belnr_d,
          gjahr TYPE gjahr,


        END OF ty_structure.

DATA : ls_structure TYPE ty_structure,
       ls_bkpf      TYPE bkpf.


ls_structure-blart = 'ZZ'.
ls_structure-bldat = '20181102'.
ls_structure-gjahr = '2018'.

MOVE-CORRESPONDING ls_structure TO ls_bkpf.



CLEAR  ls_bkpf.
