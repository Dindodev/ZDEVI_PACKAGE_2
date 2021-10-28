*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 07:23:41
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z02T_EMP_DET....................................*
DATA:  BEGIN OF STATUS_Z02T_EMP_DET                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z02T_EMP_DET                  .
CONTROLS: TCTRL_Z02T_EMP_DET
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z02T_EMP_DET                  .
TABLES: Z02T_EMP_DET                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
