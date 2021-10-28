*&---------------------------------------------------------------------*
*& Report Z07R_FLIGHTIT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z07r_flightit.
TABLES : sflight.


DATA : it_flight  TYPE TABLE OF sflight,
       lw_sflight TYPE sflight.

SELECT * FROM sflight INTO TABLE it_flight UP TO 10 ROWS.

*select upto 10 rows in to internal table from sflight

IF sy-subrc = 0.
  LOOP AT it_flight INTO  lw_sflight.


    WRITE  lw_sflight-fldate.
    WRITE  lw_sflight-carrid.
    WRITE  lw_sflight-price.
    New-Line.
  ENDLOOP.

ELSE.
  MESSAGE 'No data found' TYPE 'E'.
ENDIF.
