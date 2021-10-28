*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 23:33:02
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZCUST_TBL.......................................*
DATA:  BEGIN OF STATUS_ZCUST_TBL                     .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCUST_TBL                     .
CONTROLS: TCTRL_ZCUST_TBL
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *ZCUST_TBL                     .
TABLES: ZCUST_TBL                      .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
