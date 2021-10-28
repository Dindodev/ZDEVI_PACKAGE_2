*&---------------------------------------------------------------------*
*& Module Pool      Z11MP_FIRST_ASN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

INCLUDE Z11_1_TOP                               .    " Global Data

* INCLUDE Z11_1_O01                               .  " PBO-Modules
* INCLUDE Z11_1_I01                               .  " PAI-Modules
* INCLUDE Z11_1_F01                               .  " FORM-Routines

*&---------------------------------------------------------------------*
*& Module STATUS_9001 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9001 OUTPUT.
 SET PF-STATUS 'Z11_PF_1'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9001  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9001 INPUT.

CASE SY-UCOMM.
  WHEN 'BACK'.
    LEAVE PROGRAM.
    ENDCASE.


ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  VALIDATION_MATERIAL  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validation_material INPUT.
 CASE sy-ucomm.
    WHEN 'DISP'.
      DATA : lv_matnr TYPE mara-matnr.
*      TABLES: mara.

      SELECT SINGLE matnr FROM mara  INTO lv_matnr WHERE matnr = mara-matnr.
      IF sy-subrc <> 0.
        MESSAGE 'Enter a valid value.' TYPE 'E'.
      ELSE.
        MESSAGE 'Correct Material Entered' TYPE 'S'.
      ENDIF.
      ENDCASE.



ENDMODULE.
