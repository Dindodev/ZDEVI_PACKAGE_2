*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 01.10.2020 at 08:05:58
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z004_EMPNAMES...................................*
DATA:  BEGIN OF STATUS_Z004_EMPNAMES                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z004_EMPNAMES                 .
CONTROLS: TCTRL_Z004_EMPNAMES
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z004_EMPNAMES                 .
TABLES: Z004_EMPNAMES                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
