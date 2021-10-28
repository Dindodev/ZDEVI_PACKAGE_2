*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 06:53:40
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z11T_EMP_TBLC...................................*
DATA:  BEGIN OF STATUS_Z11T_EMP_TBLC                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z11T_EMP_TBLC                 .
CONTROLS: TCTRL_Z11T_EMP_TBLC
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z11T_EMP_TBLC                 .
TABLES: Z11T_EMP_TBLC                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
