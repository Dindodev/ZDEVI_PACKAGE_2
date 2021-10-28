*&---------------------------------------------------------------------*
*& Report Z13R_FLIGHT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z13R_FLIGHT.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.

PARAMETERS: p_airlne TYPE s_carr_id OBLIGATORY,
            p_flno   TYPE s_conn_id,
            p_fldate TYPE s_date OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.


"Global structure
DATA: gs_glob_struc TYPE sflight.


"Local structure
TYPES: BEGIN OF l_ty_flight,
         carrid TYPE s_carr_id,
         connid TYPE s_conn_id,
         fldate TYPE s_date,
         price  TYPE s_price,
       END OF l_ty_flight.



DATA: lt_flight TYPE TABLE OF l_ty_flight,
      ls_flight TYPE l_ty_flight.


START-OF-SELECTION.

SELECT carrid
       connid
       fldate
       price
        FROM sflight INTO TABLE lt_flight WHERE carrid = p_airlne OR
                                                 connid = p_flno OR
                                                 fldate = p_fldate .

IF sy-subrc = 0.
  LOOP AT lt_flight INTO ls_flight.
    WRITE:/ ls_flight-carrid, ls_flight-connid, ls_flight-fldate, ls_flight-price.
  ENDLOOP.
ENDIF.
