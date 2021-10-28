class Z02CL_INTERF definition
  public
  final
  create public .

public section.

  interfaces Z02I_INTERF .
protected section.
private section.
ENDCLASS.



CLASS Z02CL_INTERF IMPLEMENTATION.


  method Z02I_INTERF~DISPLAY_DETAILS.
*    DATA: ls_ekko TYPE l_ty_po.
**    DATA: lt_ekko TYPE TABLE OF l_ty_po.
*
*    LOOP AT lt_ekko INTO ls_ekko.
*
*      WRITE:/ ls_ekko-ebeln, ls_ekko-bukrs, ls_ekko-bstyp, ls_ekko-bsart.
*
*    ENDLOOP.
  endmethod.


  method Z02I_INTERF~GET_DETAILS.
     DATA: ex_ref TYPE REF TO cx_root.
    DATA: message_text TYPE string.

*    SELECT ebeln
*           bukrs
*           bstyp
*           bsart FROM ekko INTO TABLE lt_ekko UP TO 10 ROWS.
*
*    IF sy-subrc NE 0.
*
*      TRY.
**          RAISE EXCEPTION TYPE CX_STATIC_CHECK. "zcx_12_poso.
*
*
*        CATCH zcx_12_poso INTO ex_ref.
*          message_text = ex_ref->get_text( ).
*          WRITE message_text.
*      ENDTRY.
*
*
*    ENDIF.

  endmethod.
ENDCLASS.
