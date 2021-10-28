*&---------------------------------------------------------------------*
*& Report Z01INTERACTIVE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01interactive.

**TABLES : ekko ,ekpo.


*PARAMETERS : p_po type ekko-ebeln.s
*
*
*TYPES : BEGIN OF ty_struct,
*  ebeln type ebeln,
*  ebelp type ebelp,
*  matnr type matnr,
*  end of ty_struct.

CONSTANTS : lc_string   TYPE char15     VALUE   'Hello World'.

TABLES: ekko, ekpo, vbak, vbap.

TYPES: BEGIN OF ty_ekko,
         ebeln TYPE ekko-ebeln,
       END OF ty_ekko.
DATA: gt_ekko  TYPE STANDARD TABLE OF ty_ekko,
      ls_ekko  TYPE ty_ekko,
      lv_ebeln TYPE ebeln.
**  gt_vbak, gs_vbap, gv_var


WRITE : lc_string.


SELECT ebeln FROM
ekko
INTO TABLE gt_ekko.

PERFORM get_item USING gt_ekko
.
*&---------------------------------------------------------------------*
*& Form get_item
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> GT_EKKO
*&---------------------------------------------------------------------*
FORM get_item  USING p_gt_ekko LIKE gt_ekko.

SELECT ebeln, ebelp
  FROM ekpo
  INTO TABLE @DATA(gt_ekpo)
  FOR ALL ENTRIES IN @p_gt_ekko
  WHERE ebeln = @p_gt_ekko-ebeln.
ENDFORM.
