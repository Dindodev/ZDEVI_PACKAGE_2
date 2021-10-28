*&---------------------------------------------------------------------*
*& Report Z13R_DEMO_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z13R_DEMO_PROGRAM.

*TYPES ty_variable(3) TYPE C.
*
*DATA lv_variable TYPE ty_variable.




*
*
*
*TYPES: BEGIN OF TY_STRUCTURE,
*         EMPID       TYPE I,
*         EMPNAME     TYPE Z13DE_EMP_NAME,
*         COMPANYCODE TYPE BKPF-BUKRS,
*
*
*       END OF TY_STRUCTURE.
*
*DATA: LT_TABLE     TYPE TABLE OF TY_STRUCTURE,
*      LS_STRUCTURE TYPE TY_STRUCTURE.
*
*LS_STRUCTURE-EMPID = 1.
*LS_STRUCTURE-EMPNAME = 'Kaushal'.
*LS_STRUCTURE-COMPANYCODE = 1000.
*
*APPEND LS_STRUCTURE TO LT_TABLE.
*CLEAR LS_STRUCTURE.
*
*LS_STRUCTURE-EMPID = 2.
*LS_STRUCTURE-EMPNAME = 'Pramod'.
*LS_STRUCTURE-COMPANYCODE = 2000.
*
*APPEND LS_STRUCTURE TO LT_TABLE.
*
*CLEAR LS_STRUCTURE.
*
*TABLES: BKPF.
*
*CONSTANTS: IC_CON TYPE BKPF-BUKRS VALUE '1000'.
*
*PARAMETERS: P_BUKRS TYPE BKPF-BUKRS OBLIGATORY.
**PARAMETERS: P_BUKRS TYPE BKPF-BUKRS DEFAULT '1000'.
*
*
*SELECT-OPTIONS: S_BUKRS FOR BKPF-BUKRS.

*
*lv_variable = 123.
*
*write lv_variable.




TYPES: BEGIN OF TY_STRUCTURE,
         BUKRS TYPE BKPF-BUKRS,
         BELNR TYPE BELNR_D,
         GJAHR TYPE GJAHR,


       END OF TY_STRUCTURE.

DATA: ls_bkpf TYPE bkpf,
      LS_STRUCTURE TYPE TY_STRUCTURE.
*ls_structure-blart = 'ZZ'.
*ls_structure-BLDAT = '20180101'.
*ls_structure-GJAHR = '2018'.

MOVE-CORRESPONDING LS_STRUCTURE TO LS_BKPF.
