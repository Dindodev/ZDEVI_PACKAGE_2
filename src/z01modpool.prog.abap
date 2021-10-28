*&---------------------------------------------------------------------*
*& Modulpool Z01MODPOOL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM Z01MODPOOL.

TABLES MARA.
TYPES : MATNR TYPE MARA-MATNR,
        ERSDA TYPE MARA-ERSDA,
        ERNAM TYPE MARA-ERNAM,
        mtart type mara-mtart,
        matkl type mara-matkl.
Start-of-selection.
*&---------------------------------------------------------------------*
*& Module STATUS_0001 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0001 OUTPUT.
SET PF-STATUS 'Z01PFSTAT'.
SET TITLEBAR 'Z01TITLE'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0001  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0001 INPUT.
  CASE SY-UCOMM.
    WHEN 'SEARCH'.
      CALL SCREEN 0002.
      ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0002 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0002 OUTPUT.
SELECT SINGLE MATNR ERSDA ERNAM mtart matkl FROM MARA
    INTO (MARA-MATNR, MARA-ERSDA, MARA-ERNAM, mara-mtart, mara-matkl)
    where matnr = mara-matnr..
ENDMODULE.

INCLUDE z01modpool_user_command_000i01.
