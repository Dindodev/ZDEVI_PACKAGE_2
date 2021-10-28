*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 06:44:00
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z004_EMPTABLE...................................*
DATA:  BEGIN OF STATUS_Z004_EMPTABLE                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z004_EMPTABLE                 .
CONTROLS: TCTRL_Z004_EMPTABLE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z004_EMPTABLE                 .
TABLES: Z004_EMPTABLE                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
