*----------------------------------------------------------------------*
***INCLUDE MZ_07ASSIGNMENT_I03.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  Validation_Material  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validation_material INPUT.
CASE sy-ucomm.

    WHEN 'ENTER'.
      DATA : lv_matnr TYPE mara-matnr.

      SELECT SINGLE matnr FROM mara  INTO lv_matnr WHERE matnr = mara-matnr.
      IF sy-subrc <> 0.
        MESSAGE 'Enter a valid value.' TYPE 'E'.
      ELSE.
        MESSAGE 'Correct Material Entered' TYPE 'S'.
      ENDIF.
      ENDCASE.
ENDMODULE.
