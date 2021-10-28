*&---------------------------------------------------------------------*
*& Report Z05R_SALES_ORDER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05r_sales_order.
TABLES : vbak.
DATA : lv_variable(10) TYPE c.
TYPES : BEGIN OF ty_structure,
  vbeln  TYPE vbak-vbeln,
  erdat TYPE vbak-erdat,
  auart TYPE vbak-auart,

 END OF ty_structure.

DATA : lt_table TYPE STANDARD TABLE OF ty_structure,
      ls_structure TYPE ty_structure.

INITIALIZATION.
SELECT-OPTIONS : s_vbeln FOR vbak-vbeln.

START-OF-SELECTION.

SELECT vbeln erdat auart FROM vbak INTO  TABLE lt_table WHERE vbeln IN s_vbeln.
* ENDSELECT,,.

* SELECT
WRITE:/ 'Sales Document','Document Date','Document Type'.
 LOOP AT lt_table INTO ls_structure.
    WRITE:/ ls_structure-vbeln,ls_structure-erdat,ls_structure-auart.
    ENDLOOP.
*  WRITE 'Success'.
