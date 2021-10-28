*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 04:57:23
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z01D_EMPID......................................*
DATA:  BEGIN OF STATUS_Z01D_EMPID                    .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z01D_EMPID                    .
CONTROLS: TCTRL_Z01D_EMPID
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z01D_EMPID                    .
TABLES: Z01D_EMPID                     .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
