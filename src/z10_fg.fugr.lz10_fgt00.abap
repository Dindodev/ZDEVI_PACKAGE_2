*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 23:34:57
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZEMP_TBL........................................*
DATA:  BEGIN OF STATUS_ZEMP_TBL                      .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEMP_TBL                      .
CONTROLS: TCTRL_ZEMP_TBL
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZEMP_TBL                      .
TABLES: ZEMP_TBL                       .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
