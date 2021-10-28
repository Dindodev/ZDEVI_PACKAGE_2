*----------------------------------------------------------------------*
***INCLUDE Z07R_ALV_GRID_FINAL_BUILD_AF01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form BUILD_ALV_HEADER
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM build_alv_header .

*  Type H is used to display headers i.e. big font
  wa_listheader-typ  = 'H'.
  wa_listheader-info ='Materials Detail Report'.
  APPEND wa_listheader TO it_listheader.
  CLEAR wa_listheader.

*  Type S is used to display key and value pairs
  wa_listheader-typ = 'S'.
  wa_listheader-key = 'Date :' .
  CONCATENATE  sy-datum+6(2)
               sy-datum+4(2)
               sy-datum(4)
               INTO wa_listheader-info
               SEPARATED BY '/'.
  APPEND wa_listheader TO it_listheader.
  CLEAR wa_listheader.

*  Type A is used to display italic font
  wa_listheader-typ = 'S'.
wa_listheader-key ='REPORT:'.
  wa_listheader-info = sy-repid.

   APPEND wa_listheader TO it_listheader.
  CLEAR wa_listheader.

  wa_listheader-typ = 'S'.

  wa_listheader-key ='USER-NAME:'.
  wa_listheader-info = sy-uname.
  APPEND wa_listheader TO it_listheader.
  CLEAR wa_listheader.
  wa_listheader-typ = 'S'.
  wa_listheader-key = 'DATE'.
  wa_listheader-info = sy-datum.


  APPEND wa_listheader TO it_listheader.
  CLEAR wa_listheader.

ENDFORM.
