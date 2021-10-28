*&---------------------------------------------------------------------*
*& Report Z03R_OOPS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03r_oops.
TABLES: ekko, vbak.
* structure for po and so internal table
TYPES: BEGIN OF ty_po,
         ebeln TYPE ebeln,          "purch doc no
         bsart TYPE esart,          "purch doc type
         statu TYPE estak,          "status of doc type
         lifnr TYPE elifn,          "vendor's acc no
       END OF ty_po,

       BEGIN OF ty_so,
         vbeln TYPE vbeln,          "sales doc no
         erdat TYPE erdat,          "creation date
         auart TYPE auart,          "sales doc type
         lifsk TYPE lifsk,          "delivery block
       END OF ty_so.
* Parameter for po no
PARAMETERS:  lp_po TYPE ebeln,
             lp_so TYPE vbak-vbeln.
* Interface is declared
INTERFACE lif_z03_details.

  METHODS: get_details IMPORTING i_pono TYPE ebeln OPTIONAL
                                 i_sono TYPE vbeln OPTIONAL
                       EXPORTING e_ekko TYPE ty_po
                                 e_vbak TYPE ty_so
                       RAISING   zcx_03_exception ,
    display_details IMPORTING e_ekko TYPE ty_po e_vbak TYPE ty_so.

ENDINTERFACE.

*Class for po definition

CLASS lcl_z03_po DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA : lv_doctype_one.                          "static attribute for doc type
    DATA : it_po     TYPE TABLE OF ty_po,                 "internal table for PO
           wa_po     TYPE ty_po,                          "work area for po
           lw_msg    TYPE scx_t100key,
           lv_symsgv TYPE symsgv.
    INTERFACES lif_z03_details.
ENDCLASS.

*po class implementation
CLASS lcl_z03_po IMPLEMENTATION.


*  implemeting interface methods
  METHOD lif_z03_details~get_details .
    SELECT SINGLE ebeln, bsart, statu, lifnr FROM ekko WHERE ebeln = @i_pono
    INTO CORRESPONDING FIELDS OF @e_ekko.

    IF sy-subrc <> 0.
      lv_symsgv = i_pono.
      RAISE EXCEPTION TYPE zcx_03_exception
        EXPORTING
*         textid = lw_msg
          msgid  = 'Z03_MSG_CLASS'
          msg1   = lv_symsgv
          msgtyp = 'E'
          msgno  = '000'.
    ENDIF.
  ENDMETHOD.

  METHOD lif_z03_details~display_details.
    WRITE:/ '***Purchase Order Details***'.
    WRITE :/ 'Purchase Doc No : ' , wa_po-ebeln,
           /'Purchase Doc Type : ', wa_po-bsart,
           /'Purchase Doc Satus : ' , wa_po-statu,
           /'Vendor Account Number: ', wa_po-lifnr.
    NEW-LINE.
  ENDMETHOD.

ENDCLASS.

* SALES ORDER CLASS DEFINITION
CLASS lcl_z03_so DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA : lv_doctype_two.                          "static attribute for doc type
    DATA : it_so     TYPE TABLE OF ty_so,                 "internal table for sO
           wa_so     TYPE ty_so,                          "work area for So
           lw_msg    TYPE scx_t100key,
           lv_symsgv_1 TYPE symsgv.
    INTERFACES lif_z03_details.
ENDCLASS.

* SALES ORDER CLASS IMPLEMENTATION
CLASS lcl_z03_so IMPLEMENTATION.


*  implemeting interface methods
  METHOD lif_z03_details~get_details .
    SELECT SINGLE vbeln, erdat, auart, lifsk FROM vbak WHERE vbeln = @i_sono
    INTO CORRESPONDING FIELDS OF @e_vbak.

    IF sy-subrc <> 0.
     lv_symsgv_1 = i_sono.
      RAISE EXCEPTION TYPE zcx_03_exception
        EXPORTING
*         textid = lw_msg
          msgid  = 'Z03_MSG_CLASS'
          msg1   = lv_symsgv_1
          msgtyp = 'E'
          msgno  = '001'.
    ENDIF.
  ENDMETHOD.

  METHOD lif_z03_details~display_details.
    WRITE:/ '***Sales Order Details***'.
    WRITE :/ 'Sales Doc No' , wa_so-vbeln,
           /'Creation Date', wa_so-erdat,
           /'Sales Doc Type' , wa_so-auart,
           /'Delivery Block', wa_so-lifsk.
    NEW-LINE.
  ENDMETHOD.

ENDCLASS.



START-OF-SELECTION.

*--Instantiate the first class--*
  DATA(lo_object) = NEW lcl_z03_po( ).
  DATA: lo_msg TYPE REF TO zcx_03_exception,
        lo_msg_1 TYPE REF TO zcx_03_exception.

*--Instantiate the second class--*
  DATA(lo_object_so) = NEW lcl_z03_so( ).

*--Call method to get Purchase Order details--*
  TRY.
      lo_object->lif_z03_details~get_details( EXPORTING
                                      i_pono =  lp_po
                                      i_sono = lp_so
                                   IMPORTING
                                      e_ekko = lo_object->wa_po ).
      WRITE:|Purchase order found { lp_po }| .

      " calling display function
      lo_object->lif_z03_details~display_details( EXPORTING
                                      e_ekko = lo_object->wa_po
                                      e_vbak = lo_object_so->wa_so ).
    CATCH zcx_03_exception INTO lo_msg.

*--Message Class based exception message reading--*
      DATA(lw_bapiret2) = VALUE bapiret2( id          = lo_msg->msgid
                                          type        = lo_msg->msgtyp
                                          number      = lo_msg->msg1
                                          message_v1  = lo_msg->msgno ).
      MESSAGE ID lw_bapiret2-id TYPE lw_bapiret2-type NUMBER lw_bapiret2-number
      WITH lw_bapiret2-message_v1 INTO lw_bapiret2-message.
      WRITE:/ lw_bapiret2-message.

**--Non Message Class based exception message reading--*
*      DATA(lv_errormsg) = lo_msg->get_text( ).
*      WRITE:/ lv_errormsg.
  ENDTRY.

free lo_msg.

*--Call method to get sales Order details--*
  TRY.
      lo_object_so->lif_z03_details~get_details( EXPORTING
                                      i_pono =  lp_po
                                      i_sono = lp_so
                                   IMPORTING
                                      e_vbak = lo_object_so->wa_so ).
      WRITE:|Sales order found { lp_so }| .

      " calling display function
      lo_object_so->lif_z03_details~display_details( EXPORTING
                                      e_ekko = lo_object->wa_po
                                      e_vbak = lo_object_so->wa_so ).
    CATCH zcx_03_exception INTO lo_msg.

*--Message Class based exception message reading--*
      DATA(lw2_bapiret2) = VALUE bapiret2( id          = lo_msg->msgid
                                          type        = lo_msg->msgtyp
                                          number      = lo_msg->msg1
                                          message_v1  = lo_msg->msgno ).
      MESSAGE ID lw2_bapiret2-id TYPE lw2_bapiret2-type NUMBER lw2_bapiret2-number
      WITH lw2_bapiret2-message_v1 INTO lw2_bapiret2-message.
      WRITE:/ lw2_bapiret2-message.

**--Non Message Class based exception message reading--*
*      DATA(lv_errormsg) = lo_msg->get_text( ).
*      WRITE:/ lv_errormsg.
  ENDTRY.
