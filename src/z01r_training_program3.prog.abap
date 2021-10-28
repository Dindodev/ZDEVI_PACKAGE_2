*&---------------------------------------------------------------------*
*& Report Z01R_TRAINING_PROGRAM3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01R_TRAINING_PROGRAM3.




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

    TOP-OF-PAGE.
    WRITE : /1 'Airline No' COLOR 1,
         20 'Price' COLOR 2,
         40   'Flight No' COLOR 3,
         60  'FlightDate' COLOR 4.
  START-OF-SELECTION.
  SELECT CARRID CONNID FLDATE PRICE FROM sflight INTO TABLE lt_table WHERE CARRID IN FLIGHTID AND CONNID IN FLIGHTNO AND  FLDATE IN dates.

 If sy-subrc = 0.
  LOOP AT lt_table INTO ls_localstruct.
    WRITE:/1 ls_localstruct-airlineNumber color 1, 20 ls_localstruct-price color 2, 40 ls_localstruct-flightNumber color 3 , 60 ls_localstruct-flightDate color 4.
  ENDLOOP.
  endif.
