*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 07:39:09
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z12_EMP.........................................*
DATA:  BEGIN OF STATUS_Z12_EMP                       .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z12_EMP                       .
CONTROLS: TCTRL_Z12_EMP
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: Z12_EMP_CHECK...................................*
DATA:  BEGIN OF STATUS_Z12_EMP_CHECK                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z12_EMP_CHECK                 .
CONTROLS: TCTRL_Z12_EMP_CHECK
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *Z12_EMP                       .
TABLES: *Z12_EMP_CHECK                 .
TABLES: Z12_EMP                        .
TABLES: Z12_EMP_CHECK                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
