*&---------------------------------------------------------------------*
*& Report Z10R_CMPLX_DATA_OBJS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z10r_cmplx_data_objs.


PARAMETERS: p_carrid TYPE s_carr_id,
            p_connid TYPE s_conn_id,
            p_fldate TYPE s_date.

" Global structure
DATA : gs_flight TYPE sflight.

" Localstructure
TYPES : BEGIN OF l_ty_flight,
          carrid TYPE s_carr_id,
          connid TYPE s_conn_id,
          fldate TYPE s_date,
          price  TYPE s_price,
        END OF l_ty_flight.

DATA : lt_flight TYPE TABLE OF l_ty_flight,
       ls_flight TYPE l_ty_flight.

SELECT carrid connid fldate price FROM sflight INTO TABLE lt_flight where carrid = p_carrid or connid = p_connid or fldate = p_fldate.

  IF sy-subrc = 0.
      LOOP AT lt_flight INTO ls_flight.
          WRITE :/ ls_flight-carrid, ls_flight-connid, ls_flight-fldate, ls_flight-price.
      ENDLOOP.
  ENDIF.
