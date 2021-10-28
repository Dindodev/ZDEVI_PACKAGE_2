*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 10.10.2018 at 03:09:37
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z07D_CHECKTABLE.................................*
DATA:  BEGIN OF STATUS_Z07D_CHECKTABLE               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z07D_CHECKTABLE               .
CONTROLS: TCTRL_Z07D_CHECKTABLE
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: Z07D_EMPTABLE...................................*
DATA:  BEGIN OF STATUS_Z07D_EMPTABLE                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z07D_EMPTABLE                 .
CONTROLS: TCTRL_Z07D_EMPTABLE
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: Z07T_EMPTABLE...................................*
DATA:  BEGIN OF STATUS_Z07T_EMPTABLE                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z07T_EMPTABLE                 .
CONTROLS: TCTRL_Z07T_EMPTABLE
            TYPE TABLEVIEW USING SCREEN '0003'.
*.........table declarations:.................................*
TABLES: *Z07D_CHECKTABLE               .
TABLES: *Z07D_EMPTABLE                 .
TABLES: *Z07T_EMPTABLE                 .
TABLES: Z07D_CHECKTABLE                .
TABLES: Z07D_EMPTABLE                  .
TABLES: Z07T_EMPTABLE                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
