*&---------------------------------------------------------------------*
*& Report Z04S_DEMO_FLIGHTTABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04s_demo_flighttable.

*&---------------------------------------------------------------------*
*& Report Z04S_DEMO_FLIGHT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
TABLES : sflight.
PARAMETERS: p_aline(10) TYPE c,
            p_ftnum(3)  TYPE c.

SELECT-OPTIONS : p_ftdate FOR sflight-fldate.


TYPES : BEGIN OF ty_sflight,
          carrid   TYPE sflight-carrid,
          price    TYPE sflight-price,
          currency TYPE sflight-currency,
          fdate    TYPE sflight-fldate,
          smax     TYPE sflight-seatsmax,

        END OF ty_sflight.

TYPES : BEGIN OF ly_sflight,
          carrid   TYPE sflight-carrid,
          price    TYPE sflight-price,
          currency TYPE sflight-currency,

        END OF ly_sflight.

DATA : ls_sflight TYPE TABLE OF ty_sflight.
DATA: lw_sflight TYPE ty_sflight.

DATA : ls_sflight1 TYPE TABLE OF ly_sflight.
DATA: lw_sflight1 TYPE ly_sflight.

START-OF-SELECTION.

SELECT carrid price currency fldate seatsmax FROM sflight INTO lw_sflight WHERE fldate IN p_ftdate.
ENDSELECT.


MOVE-CORRESPONDING ls_sflight TO ls_sflight1.

LOOP AT ls_sflight1 INTO lw_sflight1.

  WRITE lw_sflight1-carrid.
  WRITE lw_sflight1-price.
  WRITE lw_sflight1-currency.

ENDLOOP.
