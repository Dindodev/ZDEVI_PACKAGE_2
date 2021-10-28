*&---------------------------------------------------------------------*
*& Report Z04S_DEMO_FLIGHT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04s_demo_flight.
TABLES : sflight.
PARAMETERS: p_aline(10) TYPE c,
            p_ftnum(3) TYPE c.

SELECT-OPTIONS : p_ftdate FOR sflight-fldate.


TYPES : BEGIN OF ty_sflight,
          carrid   TYPE sflight-carrid,
          price    TYPE sflight-price,
          currency TYPE sflight-currency,
          fdate    TYPE sflight-fldate,
          smax     TYPE sflight-seatsmax,

        END OF ty_sflight.

DATA : ls_sflight TYPE ty_sflight.

SELECT carrid price currency fldate seatsmax FROM sflight INTO ls_sflight WHERE fldate IN p_ftdate.
  ENDSELECT.


  TYPES : BEGIN OF ly_sflight,
            carrid   TYPE sflight-carrid,
            price    TYPE sflight-price,
            currency TYPE sflight-currency,

          END OF ly_sflight.
          Data : ls_sflight1 type ly_sflight.

  MOVE-CORRESPONDING ls_sflight TO ls_sflight1.

  write ls_sflight-carrid.
  write ls_sflight-price.
  write ls_sflight-currency.
