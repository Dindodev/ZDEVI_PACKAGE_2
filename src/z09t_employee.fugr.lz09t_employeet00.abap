*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 25.10.2018 at 07:19:35
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z09T_EMPLOYEE...................................*
DATA:  BEGIN OF STATUS_Z09T_EMPLOYEE                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z09T_EMPLOYEE                 .
CONTROLS: TCTRL_Z09T_EMPLOYEE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z09T_EMPLOYEE                 .
TABLES: Z09T_EMPLOYEE                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
