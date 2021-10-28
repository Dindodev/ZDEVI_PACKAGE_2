*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 07:17:43
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z09T_EMPLOYEE_DE................................*
DATA:  BEGIN OF STATUS_Z09T_EMPLOYEE_DE              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z09T_EMPLOYEE_DE              .
CONTROLS: TCTRL_Z09T_EMPLOYEE_DE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z09T_EMPLOYEE_DE              .
TABLES: Z09T_EMPLOYEE_DE               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
