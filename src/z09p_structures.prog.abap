*&---------------------------------------------------------------------*
*& Report Z09P_STRUCTURES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z09P_STRUCTURES.

TABLES: sflight.

SELECT-OPTIONS: date for sflight-FLDATE.
SELECT-OPTIONS: airline for sflight-CARRID.
SELECT-OPTIONS: airnum for sflight-CONNID.


TYPES: BEGIN OF ty_structure,
       CARRID TYPE sflight-CARRID,
       CONNID TYPE sflight-CONNID,
       FLDATE TYPE sflight-FLDATE,
       price TYPE sflight-price,
       END OF ty_structure.

DATA: lt_table TYPE TABLE OF sflight,
      lt_table2 TYPE table of ty_structure,
      ls_local_stru TYPE ty_structure.


START-OF-SELECTION.

SELECT  * from sflight INTO TABLE lt_table WHERE FLDATE in date and CARRID in airline and  CONNID in airnum.

  IF sy-subrc = 0.

MOVE-CORRESPONDING lt_table to lt_table2.

LOOP AT lt_table2 INTO ls_local_stru.
  WRITE:/ ls_local_stru-CARRID, ls_local_stru-CONNID,ls_local_stru-FLDATE,ls_local_stru-price.
 ENDLOOP.
ENDIF.
