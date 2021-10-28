class ZCL_IM_PO_ME_PROCESS_PO_CU definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces IF_EX_ME_PROCESS_PO_CUST .
protected section.
private section.
ENDCLASS.



CLASS ZCL_IM_PO_ME_PROCESS_PO_CU IMPLEMENTATION.


  method IF_EX_ME_PROCESS_PO_CUST~CHECK.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~CLOSE.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~FIELDSELECTION_HEADER.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~FIELDSELECTION_HEADER_REFKEYS.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~FIELDSELECTION_ITEM.
    DATA : lv_answer TYPE c.
    break snagndrab001.
    IF sy-uname ='snagndrab001'.
    CALL FUNCTION 'POPUP_TO_CONFIRM'
               EXPORTING
                    titlebar      =         'Warning Message'
                    text_question =    'Cumulative credit check for non ret order'

                       text_button_1               = 'Yes'
                       text_button_2               = 'No'
                       default_button              = '2'
                       display_cancel_button       = ''
               IMPORTING
                      answer                      = lv_answer
               EXCEPTIONS
                      text_not_found              = 1
                      OTHERS                      = 2.

          CASE lv_answer.
            WHEN '1'.
              leave program.
            WHEN '2'.
*              Leave Screen.
            WHEN OTHERS.
*              N/a
          ENDCASE.
ENDIF.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~FIELDSELECTION_ITEM_REFKEYS.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~INITIALIZE.
    break-point.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~OPEN.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~POST.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~PROCESS_ACCOUNT.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~PROCESS_HEADER.

   break mullasa001.


  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~PROCESS_ITEM.
BREAK SNAGNDRAB001.
  endmethod.


  method IF_EX_ME_PROCESS_PO_CUST~PROCESS_SCHEDULE.
  endmethod.
ENDCLASS.
