*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 22.10.2018 at 10:32:14
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z07T_USERINFOR..................................*
DATA:  BEGIN OF STATUS_Z07T_USERINFOR                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z07T_USERINFOR                .
CONTROLS: TCTRL_Z07T_USERINFOR
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z07T_USERINFOR                .
TABLES: Z07T_USERINFOR                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
