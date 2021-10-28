*&---------------------------------------------------------------------*
*& Report Z09R_OOPS_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z09R_OOPS_PROGRAM.

TABLES: ekko, vbak.

TYPES : BEGIN OF ty_po,
         ebeln TYPE ebeln,
         bsart TYPE esart,
         statu TYPE estak,
         lifnr TYPE elifn,
       END OF ty_po,

       BEGIN OF ty_so,
         vbeln TYPE vbeln,
         erdat TYPE erdat,
         auart TYPE auart,
         lifsk TYPE lifsk,
       END OF ty_so.

PARAMETERS:  lp_po TYPE ekko-ebeln,
             lp_so TYPE vbak-vbeln.

*INTERFACES ZIF_Z09_DETAILGET.

CLASS lcl_z09_po DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA : lv_doctype_one.
    DATA : it_po     TYPE TABLE OF ty_po,
           wa_po     TYPE ty_po,
           lw_msg    TYPE scx_t100key,
           lv_symsgv TYPE symsgv.
    INTERFACES ZIF_Z09_DETAILGET.
ENDCLASS.


CLASS lcl_z09_po IMPLEMENTATION.

  METHOD ZIF_Z09_DETAILGET~get_details .
    SELECT SINGLE ebeln, bsart, statu, lifnr FROM ekko WHERE ebeln = @i_pono
    INTO CORRESPONDING FIELDS OF @e_ekko.

    IF sy-subrc <> 0.
      lv_symsgv = i_pono.
      RAISE EXCEPTION TYPE ZCX_09_EXCEPTION
        EXPORTING
*
*          msgid  = 'Z09_MSG_CLASS'
          msg1   = lv_symsgv
          msgtyp = 'E'
          msgno  = '000'.
    ENDIF.
  ENDMETHOD.

  METHOD ZIF_Z09_DETAILGET~display_details.
    WRITE:/ '***Purchase Order Details***'.
    WRITE :/ 'Purchase Doc No : ' , wa_po-ebeln,
           /'Purchase Doc Type : ', wa_po-bsart,
           /'Purchase Doc Satus : ' , wa_po-statu,
           /'Vendor Account Number: ', wa_po-lifnr.
    NEW-LINE.
  ENDMETHOD.

ENDCLASS.


CLASS lcl_z09_so DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA : lv_doctype_two.
    DATA : it_so     TYPE TABLE OF ty_so,
           wa_so     TYPE ty_so,
           lw_msg    TYPE scx_t100key,
           lv_symsgv_1 TYPE symsgv.
    INTERFACES ZIF_Z09_DETAILGET.
ENDCLASS.


CLASS lcl_z09_so IMPLEMENTATION.



  METHOD ZIF_Z09_DETAILGET~get_details .
    SELECT SINGLE vbeln, erdat, auart, lifsk FROM vbak WHERE vbeln = @i_sono
    INTO CORRESPONDING FIELDS OF @e_vbak.

    IF sy-subrc <> 0.
     lv_symsgv_1 = i_sono.
      RAISE EXCEPTION TYPE ZCX_09_EXCEPTION
        EXPORTING

          msgid  = 'Z09_MSG_CLASS'
          msg1   = lv_symsgv_1
          msgtyp = 'E'
          msgno  = '001'.
    ENDIF.
  ENDMETHOD.

  METHOD ZIF_Z09_DETAILGET~display_details.
    WRITE:/ '***Sales Order Details***'.
    WRITE :/ 'Sales Doc No' , wa_so-vbeln,
           /'Creation Date', wa_so-erdat,
           /'Sales Doc Type' , wa_so-auart,
           /'Delivery Block', wa_so-lifsk.
    NEW-LINE.
  ENDMETHOD.

ENDCLASS.



START-OF-SELECTION.

  DATA(lo_object) = NEW lcl_z09_po( ).
  DATA: lo_msg TYPE REF TO ZCX_09_EXCEPTION,
        lo_msg_1 TYPE REF TO ZCX_09_EXCEPTION.

  DATA(lo_object_so) = NEW lcl_z09_so( ).

  TRY.
      lo_object->ZIF_Z09_DETAILGET~get_details( EXPORTING
                                      i_pono =  lp_po
                                      i_sono = lp_so
                                   IMPORTING
                                      e_ekko = lo_object->wa_po ).
      WRITE:|Purchase order found { lp_po }| .

      lo_object->ZIF_Z09_DETAILGET~display_details( EXPORTING
                                      e_ekko = lo_object->wa_po
                                      e_vbak = lo_object_so->wa_so ).
    CATCH zcx_09_exception INTO lo_msg.

      DATA(lw_bapiret2) = VALUE bapiret2( id          = lo_msg->msgid
                                          type        = lo_msg->msgtyp
                                          number      = lo_msg->msg1
                                          message_v1  = lo_msg->msgno ).
      MESSAGE ID lw_bapiret2-id TYPE lw_bapiret2-type NUMBER lw_bapiret2-number
      WITH lw_bapiret2-message_v1 INTO lw_bapiret2-message.
      WRITE:/ lw_bapiret2-message.

  ENDTRY.

free lo_msg.

  TRY.
      lo_object_so->ZIF_Z09_DETAILGET~get_details( EXPORTING
                                      i_pono =  lp_po
                                      i_sono = lp_so
                                   IMPORTING
                                      e_vbak = lo_object_so->wa_so ).
      WRITE:|Sales order found { lp_so }| .

      lo_object_so->ZIF_Z09_DETAILGET~display_details( EXPORTING
                                      e_ekko = lo_object->wa_po
                                      e_vbak = lo_object_so->wa_so ).
    CATCH zcx_09_exception INTO lo_msg.

      DATA(lw2_bapiret2) = VALUE bapiret2( id          = lo_msg->msgid
                                          type        = lo_msg->msgtyp
                                          number      = lo_msg->msg1
                                          message_v1  = lo_msg->msgno ).
      MESSAGE ID lw2_bapiret2-id TYPE lw2_bapiret2-type NUMBER lw2_bapiret2-number
      WITH lw2_bapiret2-message_v1 INTO lw2_bapiret2-message.
      WRITE:/ lw2_bapiret2-message.

  ENDTRY.
