class ZLCL_12_PO definition
  public
  final
  create public .

public section.

  interfaces ZIF_12_POSO .
protected section.
private section.

  types:
    BEGIN OF L_TY_PO,
          ebeln TYPE ebeln,
          bukrs TYPE bukrs,
          bstyp TYPE ebstyp,
          bsart TYPE esart,
        END OF l_ty_po .

  data:
    LT_EKKO TYPE TABLE OF l_ty_po .
  class-data IV_DOC_TYPE TYPE ekko-bsart.
ENDCLASS.



CLASS ZLCL_12_PO IMPLEMENTATION.


  method ZIF_12_POSO~DISPLAY_DETAILS.

    DATA: ls_ekko TYPE l_ty_po.
*    DATA: lt_ekko TYPE TABLE OF l_ty_po.

    LOOP AT lt_ekko INTO ls_ekko.

      WRITE:/ ls_ekko-ebeln, ls_ekko-bukrs, ls_ekko-bstyp, ls_ekko-bsart.

    ENDLOOP.
  endmethod.


  METHOD zif_12_poso~get_details.

    DATA: ex_ref TYPE REF TO cx_root.
    DATA: message_text TYPE string.

    SELECT ebeln
           bukrs
           bstyp
           bsart FROM ekko INTO TABLE lt_ekko UP TO 10 ROWS.

    IF sy-subrc NE 0.

*      TRY.
*          RAISE EXCEPTION TYPE zcx_12_poso.
*
*
*        CATCH zcx_12_poso INTO ex_ref.
*          message_text = ex_ref->get_text( ).
*          WRITE message_text.
*      ENDTRY.


    ENDIF.



  ENDMETHOD.
ENDCLASS.
