*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 23:43:27
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z02T_EMP_DETC...................................*
DATA:  BEGIN OF STATUS_Z02T_EMP_DETC                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z02T_EMP_DETC                 .
CONTROLS: TCTRL_Z02T_EMP_DETC
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *Z02T_EMP_DETC                 .
TABLES: Z02T_EMP_DETC                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
