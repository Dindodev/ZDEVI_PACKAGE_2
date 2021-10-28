*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 04:54:32
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z03T_EMPMASTER..................................*
DATA:  BEGIN OF STATUS_Z03T_EMPMASTER                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z03T_EMPMASTER                .
CONTROLS: TCTRL_Z03T_EMPMASTER
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z03T_EMPMASTER                .
TABLES: Z03T_EMPMASTER                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
