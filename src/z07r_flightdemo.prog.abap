*&---------------------------------------------------------------------*
*& Report Z07R_FLIGHTDEMO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z07r_flightdemo.
TABLES : sflight.
PARAMETERS : air TYPE c length 3,
             flt TYPE c length 3 obligatory.
SELECT-OPTIONS: fld FOR sflight-fldate obligatory.



*custom type structure
TYPES: BEGIN OF ld_flightcust,
         CARRID TYPE sflight-carrid,
         fldate TYPE sflight-fldate,
       END OF ld_flightcust.
* Custom work area, Standard work area
DATA : lw_sflightcust TYPE ld_flightcust,
       lw_sflight     TYPE sflight.

SELECT SINGLE carrid fldate FROM sflight INTO lw_sflightcust
WHERE carrid EQ flt
and fldate IN fld.



IF sy-subrc = 0.

  MOVE-Corresponding lw_sflightcust TO lw_sflight.
  WRITE   lw_sflight-carrid.
  WRITE   lw_sflight-fldate.
ELSE.
  MESSAGE 'No data found' TYPE 'E'.
ENDIF.
