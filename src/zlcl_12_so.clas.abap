class ZLCL_12_SO definition
  public
  final
  create public .

public section.

  interfaces ZIF_12_POSO .
protected section.
private section.

  types:
    BEGIN OF L_TY_SO,
          vbeln TYPE vbeln_va,
          ernam TYPE ernam,
          auart TYPE auart,
          END OF l_ty_so .

  data:
    GT_VBAK  TYPE TABLE OF l_ty_so .
  class-data GV_DOC_TYPE TYPE vbak-auart .
ENDCLASS.



CLASS ZLCL_12_SO IMPLEMENTATION.


  method ZIF_12_POSO~DISPLAY_DETAILS.

    DATA: gs_vbak TYPE l_ty_so.

    LOOP AT gt_vbak INTO gs_vbak.

      WRITE:/ gs_vbak-vbeln, gs_vbak-ernam, gs_vbak-auart.

    ENDLOOP.
  endmethod.


  method ZIF_12_POSO~GET_DETAILS.

    SELECT vbeln ernam auart FROM vbak INTO TABLE gt_vbak UP TO 10 ROWS.
  endmethod.
ENDCLASS.
