class ZCL_IM_PO_ME_GUI_PO_CUST definition
  public
  final
  create public .

public section.

  interfaces IF_EX_ME_GUI_PO_CUST .
protected section.
private section.
ENDCLASS.



CLASS ZCL_IM_PO_ME_GUI_PO_CUST IMPLEMENTATION.


  method IF_EX_ME_GUI_PO_CUST~EXECUTE.
  endmethod.


  method IF_EX_ME_GUI_PO_CUST~MAP_DYNPRO_FIELDS.
  endmethod.


  method IF_EX_ME_GUI_PO_CUST~SUBSCRIBE.
  Data : zz_answer TYPE c.
    if SY-UNAME ='SNAGNDRAB001' OR SY-UNAME = 'VBADARINAR00'.
       Message 'Hi' TYPE 'I'.

    "  CALL FUNCTION 'POPUP_TO_CONFIRM'
     "          EXPORTING
      "              titlebar      =         'Warning Message'
       "             text_question =    'Cumulative credit check for non ret order'

        "               text_button_1               = 'Yes'
         "              text_button_2               = 'No'
          "             default_button              = '2'
           "            display_cancel_button       = ''
            "   IMPORTING
             "         answer                      = zz_answer
             "  EXCEPTIONS
              "        text_not_found              = 1
               "       OTHERS                      = 2.

        "  CASE zz_answer.
         "   WHEN '1'.
"Message 'Hello' TYPE 'I'.
 "           WHEN '2'.
  "            Message 'Hi' TYPE 'I'.

   "         WHEN OTHERS.
*              N/a
    "      ENDCASE.

      ENDIF.
  endmethod.


  method IF_EX_ME_GUI_PO_CUST~TRANSPORT_FROM_DYNP.
  endmethod.


  method IF_EX_ME_GUI_PO_CUST~TRANSPORT_FROM_MODEL.
  endmethod.


  method IF_EX_ME_GUI_PO_CUST~TRANSPORT_TO_DYNP.
  endmethod.


  method IF_EX_ME_GUI_PO_CUST~TRANSPORT_TO_MODEL.
  endmethod.
ENDCLASS.
