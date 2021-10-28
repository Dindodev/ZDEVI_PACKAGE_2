*&---------------------------------------------------------------------*
*& Report Z11R_DEMO_FLIGHT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z11r_demo_flight.

TABLES sflight.

DATA ls_flight TYPE sflight.

TYPES : BEGIN OF ty_finaldata,
          carrid    TYPE s_carr_id,
          connid    TYPE s_conn_id,
          fldate    TYPE s_date,
          price     TYPE s_price,
          currency  TYPE s_currcode,
          planetype TYPE s_planetye,
        END OF ty_finaldata.


DATA : lt_fnal TYPE TABLE OF ty_finaldata,
       ls_fnal TYPE ty_finaldata.

PARAMETERS p_alid TYPE sflight-carrid OBLIGATORY.
PARAMETERS p_alcn TYPE sflight-connid.
PARAMETERS p_aldt TYPE sflight-fldate.



AT SELECTION-SCREEN ON p_alid.
  IF p_alid IS INITIAL.
    MESSAGE 'Please select range' TYPE 'E'.

  ENDIF.

START-OF-SELECTION.

*Select the fields from the sflight
  SELECT  carrid connid fldate price currency planetype FROM sflight INTO TABLE lt_fnal WHERE
          carrid EQ p_alid OR
          connid EQ p_alcn OR
  fldate EQ p_aldt.
  IF sy-subrc NE 0.
    MESSAGE 'No Flights found for the selection criteria' TYPE 'E'.
  ENDIF.



END-OF-SELECTION.

  LOOP AT lt_fnal INTO ls_fnal.
    WRITE :/1 ls_fnal-carrid,
    20 ls_fnal-connid,
    40 ls_fnal-fldate,
    60 ls_fnal-currency,
    80 ls_fnal-price,
    100 ls_fnal-planetype.
    HIDE:ls_fnal-connid.
  ENDLOOP.
*Table Headers
TOP-OF-PAGE.
  WRITE : /1 'Flight ID' COLOR 1,
         20  'Connection ID' COLOR 2,
         40   'flight Date' COLOR 2,
         60   'currency' COLOR 2,
         80   'price' COLOR 2,
         100   'flight type' COLOR 2.
