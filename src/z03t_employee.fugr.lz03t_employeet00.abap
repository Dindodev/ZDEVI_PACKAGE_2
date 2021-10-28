*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 07:35:09
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z03T_EMPLOYEE...................................*
DATA:  BEGIN OF STATUS_Z03T_EMPLOYEE                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z03T_EMPLOYEE                 .
CONTROLS: TCTRL_Z03T_EMPLOYEE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z03T_EMPLOYEE                 .
TABLES: Z03T_EMPLOYEE                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
