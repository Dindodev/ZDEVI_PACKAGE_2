*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 05:53:50
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z00T_EMPMASTER..................................*
DATA:  BEGIN OF STATUS_Z00T_EMPMASTER                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z00T_EMPMASTER                .
CONTROLS: TCTRL_Z00T_EMPMASTER
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z00T_EMPMASTER                .
TABLES: Z00T_EMPMASTER                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
