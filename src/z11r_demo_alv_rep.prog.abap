*&---------------------------------------------------------------------*
*& Report Z11R_DEMO_ALV_REP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z11R_DEMO_ALV_REP.
type-POOLs:slis.


DATA: BEGIN OF ty_data,
MATNR like mara-matnr,
WERKS LIKE MARC-WERKS,
LGORT LIKE MARD-LGORT,
MTART like mara-MTART,
ERSDA like mara-ERSDA,
ERNAM like mara-ERNAM,
*XCHAR like mara-XCHAR,
MAKTX like makt-maktx,
END OF ty_data.


DATA: report_id LIKE sy-repid.
DATA: ws_title TYPE lvc_title VALUE 'An ALV Report'.
DATA: i_layout TYPE slis_layout_alv.
DATA: i_fieldcat TYPE slis_t_fieldcat_alv.
DATA: i_events TYPE slis_t_event.
DATA: i_header TYPE slis_t_listheader.
