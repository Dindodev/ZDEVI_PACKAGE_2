*&---------------------------------------------------------------------*
*& Report Z02R_REPORT1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02r_report1.


TYPES : BEGIN OF ty_structure,    " To Display we need a structure to hold the following values


         salesdoc       TYPE vbak-vbeln,
         dateoncreation TYPE vbak-auart,
         salesdoctype   TYPE vbak-erdat,


       END OF ty_structure.

DATA : lt_table TYPE TABLE OF ty_structure. " We create an internal table fetching from structure which inturns fetches from vbak document
DATA : wa_vbak TYPE  ty_structure.           " we also need a work area to show values of an internal table.

TABLES : vbak.  "define which table
WRITE : /1 'SALES DOC' COLOR 1,
        20 'DATE ON CREATION' COLOR 2,
        40   'SALES DOC TYPE' COLOR 3.


SELECT-OPTIONS : ls_sales FOR vbak-vbeln.    "select options



SELECT vbeln auart erdat FROM vbak INTO TABLE lt_table WHERE vbeln IN ls_sales.
"Select all and put into table , since we cant define the range we iterate through all until the end.
LOOP AT lt_table INTO wa_vbak .                       "Push to work area
 WRITE :  1 wa_vbak-salesdoc COLOR 1,
 20 wa_vbak-dateoncreation COLOR 2,
 40 wa_vbak-salesdoctype COLOR 3.

 NEW-LINE.                                "/NEW LINE
 "Display
ENDLOOP.


TABLES : vbap.


TYPES : BEGIN OF ry_structure,    " To Display we need a structure to hold the following values


         salesdoc       TYPE vbap-vbeln,
         salesdocitem   TYPE vbap-posnr,
         dateoncreation TYPE vbap-matnr,
         salesdoctype1  TYPE vbap-matkl,


       END OF ry_structure.

DATA : i_table TYPE TABLE OF ry_structure. " We create an internal table fetching from structure which inturns fetches from vbak document
DATA : wa_vbap TYPE  ry_structure.           " we also need a work area to show values of an internal table.


AT LINE-SELECTION.
 WRITE : /1 'SALES DOC' COLOR 1,
        20 'SALES DOC ITEM' COLOR 2,
        40 'DATE ON CREATION' COLOR 3,
        60   'SALES DOC TYPE' COLOR 4.

 ULINE .
