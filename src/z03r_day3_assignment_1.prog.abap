*&---------------------------------------------------------------------*
*& Report Z03R_DAY3_ASSIGNMENT_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03r_day3_assignment_1.

* parameters for the selection screen
PARAMETERS : lp_aline TYPE c LENGTH 20 OBLIGATORY,
             lp_fnum  TYPE c LENGTH 20 OBLIGATORY,
             lp_fdat  TYPE dats OBLIGATORY.

* defining the structures for data retrival displaying

TYPES : BEGIN OF ls_str,

          carrid TYPE sflight-carrid,
          connid TYPE sflight-connid,
          fldate TYPE sflight-fldate,

        END OF ls_str.

* defining dictionary type structure and local type structure, internal table
DATA: lw_sflt  TYPE sflight,
      lw_flgt  TYPE  ls_str.

* Top of page header
TOP-OF-PAGE.
  WRITE 'Flight Airline Information'.

* checking if the entered airline is valid or not.
* Start of selection
START-OF-SELECTION.
  SELECT SINGLE carrid FROM sflight INTO lw_sflt WHERE carrid = lp_aline and connid = lp_fnum.

  IF sy-subrc NE 0.
    MESSAGE 'The combination information is not correct. Please enter correct value' TYPE 'E'.
  ENDIF.



* clearing the structure
  CLEAR lw_sflt.

* fetching the data from the table sflght
  SELECT SINGLE carrid connid fldate FROM sflight INTO CORRESPONDING FIELDS OF lw_flgt WHERE carrid = lp_aline OR connid = lp_fnum OR fldate = lp_fdat.
  IF sy-subrc NE 0.
    MESSAGE 'Data could not be fetched.' TYPE 'E'.
  ELSE.

    WRITE:/ lw_flgt-carrid,
            lw_flgt-connid,
            lw_flgt-fldate.

    NEW-LINE.
    ENDIF.

END-OF-SELECTION.

* End of the page
END-OF-PAGE.
  WRITE 'Footer Text'.
