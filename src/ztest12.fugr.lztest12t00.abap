*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 29.01.2021 at 08:17:48
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZTR1............................................*
DATA:  BEGIN OF STATUS_ZTR1                          .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTR1                          .
CONTROLS: TCTRL_ZTR1
            TYPE TABLEVIEW USING SCREEN '0123'.
*.........table declarations:.................................*
TABLES: *ZTR1                          .
TABLES: ZTR1                           .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
