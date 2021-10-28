*----------------------------------------------------------------------*
***INCLUDE Z13M_ASSIGNMENT_1_VALIDATIOI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  VALIDATION_MATERIAL  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validation_material INPUT.

  CASE sy-ucomm.
    WHEN 'DISPLAY'.
      DATA : lv_matnr TYPE mara-matnr.
      TABLES: mara.

      SELECT SINGLE matnr FROM mara  INTO lv_matnr WHERE matnr = mara-matnr.
      IF sy-subrc <> 0.
        MESSAGE 'Enter a valid value.' TYPE 'E'.
      ELSE.
        MESSAGE 'Correct Material Entered' TYPE 'S'.
      ENDIF.
      ENDCASE.
ENDMODULE.
