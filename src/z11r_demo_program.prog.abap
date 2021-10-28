*&---------------------------------------------------------------------*
*& Report Z11R_DEMO_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z11R_DEMO_PROGRAM.
*
*TYPES ty_variable(3) TYPE c.
*
*data lv_variable  TYPE TY_VARIABLE.
*lv_variable = text-001.
*write lv_variable.



*TABLES bkpf.
*constants: lc_con type bkpf-bukrs VALUE '1000'.
*
**for parametres screen.
*PARAMETERS :p_bukrs type bkpf-bukrs OBLIGATORY.
**PARAMETERS :p_bukrs type bkpf-bukrs DEFAULT '1000'.
*select-OPTIONS :s_bukrs for bkpf-bukrs.
*


*TYPES: BEGIN OF ty_Structure,
*  empid type i,
*  empName type Z11DE_EMP_NAME,
*  companycode type bkpf-BUKRS,
*  items type      Z11TT_TABLE,
*
* END OF ty_Structure.
*
*data :lt_table TYPE TABLE OF TY_STRUCTURE,
*      ls_Structure type ty_Structure.

*LS_STRUCTURE-empid = 1.
*LS_STRUCTURE-empName = 'Pramod'.
*LS_STRUCTURE-companycode  = 1000 .
*
*append LS_STRUCTURE to Lt_TABLE.
*clear LS_STRUCTURE.
*
*LS_STRUCTURE-empid = 2.
*LS_STRUCTURE-empName = 'SJ'.
*LS_STRUCTURE-companycode  = 2000 .
*
*append LS_STRUCTURE to Lt_TABLE.
*
*clear LS_STRUCTURE.

* structure assignment
*TYPES: BEGIN OF ty_Structure,
* BLART TYPE bkpf-bukrs,
* BLDAT type belnr_d,
*  gjahr type gjahr,
*
* END OF ty_Structure.
*
* Data :ls_structure type TY_STRUCTURE,
*       ls_bkpf type bkpf.
*
* ls_structure-BLART ='AA'.
* ls_structure-BLDAT = '20180101'.
* ls_structure-GJAHR = '2018'.
* move ls_structure to ls_bkpf.
** MOVE-CORRESPONDING ls_structure to ls_bkpf.

PARAMETERS : p_Fvalue type i OBLIGATORY,
            p_Svalue type i OBLIGATORY,
            p_optor(1) type c.

TYPES ty_FValue  TYPE i.

data lv_fValue  TYPE ty_FValue.



if P_FVALUE > 0 and p_sValue > 0.
  CASE   p_optor.
    WHEN '+'.
      lv_fValue = P_FVALUE + p_sValue.
       write:/'Summation value',lv_fValue.
    WHEN '-'.
     lv_fValue = P_FVALUE - p_sValue.
       write:/'Substration Value', lv_fValue.
    WHEN '*'.
       lv_fValue = P_FVALUE * p_sValue.
       write:/'Multiplication value', lv_fValue.
    WHEN '/'.
 lv_fValue = P_FVALUE / p_sValue.
       write:'Division value', lv_fValue.
    WHEN OTHERS.
      write  'No Proper values'.
  ENDCASE.
ELSE.
  message 'Values must be more than 0' type 'E'.
ENDIF.
