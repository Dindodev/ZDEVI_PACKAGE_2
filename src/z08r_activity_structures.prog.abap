*&---------------------------------------------------------------------*
*& Report Z08R_ACTIVITY_STRUCTURES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z08r_activity_structures.

TABLES : sflight.


SELECT-OPTIONS : Carrier FOR sflight-carrid.
SELECT-OPTIONS : Flightn FOR sflight-connid.
SELECT-OPTIONS : dates FOR sflight-fldate.


TYPES : BEGIN OF ls_structure,
          carrid TYPE sflight-carrid,
          connid  TYPE sflight-connid,
          fldate    TYPE sflight-fldate,
          price         TYPE sflight-price,

        END OF ls_structure.

DATA : lt_table       TYPE TABLE OF sflight,
       lt_table2      TYPE TABLE OF ls_structure,
       ls_localstruct TYPE ls_structure.

START-OF-SELECTION.
  SELECT * FROM sflight INTO TABLE lt_table WHERE carrid IN Carrier AND connid IN Flightn AND  fldate IN dates.
  IF sy-subrc = 0.


  MOVE-CORRESPONDING lt_table TO lt_table2.


  LOOP AT lt_table2 INTO ls_localstruct.
    WRITE:/ ls_localstruct-carrid, ls_localstruct-price, ls_localstruct-fldate,ls_localstruct-connid.
  ENDLOOP.
  ENDIF.
