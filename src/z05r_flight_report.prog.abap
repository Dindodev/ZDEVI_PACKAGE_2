*&---------------------------------------------------------------------*
*& Report Z05R_FLIGHT_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z05R_FLIGHT_REPORT.

TABLES : SFLIGHT.

TYPES : BEGIN OF ty_structure,
        CARRID TYPE SFLIGHT-CARRID,
        CONNID TYPE SFLIGHT-CONNID,
        FLDATE TYPE SFLIGHT-FLDATE,
        END OF ty_structure.



PARAMETERS : p_airlin TYPE SFLIGHT-CARRID OBLIGATORY,
             p_fl_Num TYPE SFLIGHT-CONNID OBLIGATORY.
     SELECT-OPTIONS  s_fl_Dat FOR sFLIGHT-FLDATE OBLIGATORY.




DATA : GW_SFlight TYPE SFLIGHT,
      LT_SFlight TYPE TABLE OF SFLIGHT,
       LW_SFlight TYPE ty_structure.

START-OF-SELECTION.
*Fetch Entries From SFLIGHT Table when user provides Airline Number, Connection Number and a date range to check.
SELECT * FROM SFLIGHT INTO table LT_SFlight WHERE carrid EQ p_airlin OR connid EQ p_fl_Num OR fldate IN s_fl_Dat.
  IF sy-subrc EQ 0.

*    Loop the entries found from internal table to a work area and write in the form of a list.
    LOOP AT lt_SFlight into GW_SFlight.

    MOVE-CORRESPONDING GW_SFlight TO LW_SFlight.
    WRITE / LW_SFlight-CARRID.
    WRITE  LW_SFlight-CONNID  .
    WRITE LW_SFlight-FLDATE.
    ENDLOOP.
  ELSE.
    MESSAGE 'Couldnt find required entry' TYPE 'E'.
  ENDIF.
