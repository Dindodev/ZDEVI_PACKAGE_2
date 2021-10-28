*&---------------------------------------------------------------------*
*& Report Z10RABAP_TRAINING
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z10RABAP_TRAINING.

*TYPES ty_variable(3) TYPE c.
*
*DATA lv_variable TYPE ty_variable.

TYPES : BEGIN OF ty_structure,
      empid type i,
      empname type ZEMP_NAME_10,
       END OF ty_structure.
DATA : lt_int_table TYPE TABLE OF ty_structure,
       ls_structure TYPE ty_structure.

CONSTANTS : lc_cons type bkpf-bukrs VALUE 'cons'.

PARAMETERS : p_bukrs type bkpf-bukrs OBLIGATORY.
TABLES: bkpf.
select-OPTIONS : s_burks for bkpf-bukrs.


ls_structure-empid = 1.
ls_structure-empname = 'santhosh'.

append ls_structure to lt_int_table.

clear ls_structure.

*lv_variable = 123.

*write lv_variable.
