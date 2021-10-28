*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 07:47:09
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z08_EMPLOYEE_DET................................*
DATA:  BEGIN OF STATUS_Z08_EMPLOYEE_DET              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z08_EMPLOYEE_DET              .
CONTROLS: TCTRL_Z08_EMPLOYEE_DET
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z08_EMPLOYEE_DET              .
TABLES: Z08_EMPLOYEE_DET               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
