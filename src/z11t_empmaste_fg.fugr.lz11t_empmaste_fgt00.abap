*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 10:32:57
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z11T_EMP_TBL....................................*
DATA:  BEGIN OF STATUS_Z11T_EMP_TBL                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z11T_EMP_TBL                  .
CONTROLS: TCTRL_Z11T_EMP_TBL
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z11T_EMP_TBL                  .
TABLES: Z11T_EMP_TBL                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
