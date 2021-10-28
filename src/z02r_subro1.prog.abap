*&---------------------------------------------------------------------*
*& Report Z02R_SUBRO1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z02R_SUBRO1.

*PARAMETERS: p_airl(10) TYPE c,
*            p_flight(10) TYPE c.

TABLES : sflight.

            SELECT-OPTIONS : dates FOR sflight-FLDATE.
            SELECT-OPTIONS : FLIGHTID FOR sflight-CARRID.
            SELECT-OPTIONS : FLIGHTNO FOR sflight-CONNID.


TYPES : BEGIN OF ls_structure,
   airlineNumber TYPE sflight-CARRID,
   flightNumber TYPE sflight-CONNID,
   flightDate TYPE sflight-FLDATE,
   price TYPE sflight-PRICE,

  END OF ls_structure.

  DATA : lt_table TYPE TABLE OF ls_structure,

         ls_localstruct TYPE ls_structure.

  START-OF-SELECTION.
  SELECT CARRID CONNID FLDATE PRICE FROM sflight INTO TABLE lt_table WHERE CARRID IN FLIGHTID AND CONNID IN FLIGHTNO AND  FLDATE IN dates.
*    MOVE-CORRESPONDING lt_table TO lt_table2.
if sy-subrc = 0.
  LOOP AT lt_table INTO ls_localstruct.
    WRITE:/ ls_localstruct-airlineNumber, ls_localstruct-price,ls_localstruct-flightNumber,ls_localstruct-flightDate.
  ENDLOOP.
  endif.
