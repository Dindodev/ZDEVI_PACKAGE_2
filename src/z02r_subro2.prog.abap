*&---------------------------------------------------------------------*
*& Report Z02R_SUBRO2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z02R_SUBRO2.

TYPES : BEGIN OF ls_str,

          carrid TYPE sflight-carrid,
          connid TYPE sflight-connid,
          fldate TYPE sflight-fldate,

        END OF ls_str.

* creating an internal structure and work area
DATA : lt_table TYPE TABLE OF ls_str,
       wa_table TYPE ls_str.

* Top of page header
TOP-OF-PAGE.
  WRITE 'Flight Airline Information'.

*Start of Selection
START-OF-SELECTION.
* fetching values from the table sflight into internal table
SELECT carrid connid fldate FROM sflight INTO  TABLE lt_table.
  IF sy-subrc NE 0.
    MESSAGE 'Data could not be fetched.' TYPE 'E'.
  ELSE.
    LOOP AT lt_table INTO wa_table.
      WRITE:/ wa_table-carrid,
              wa_table-connid,
              wa_table-fldate.

    ENDLOOP.
  ENDIF.



* End of the page
END-OF-PAGE.
  WRITE 'Footer Text'.
