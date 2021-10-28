*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 25.10.2018 at 07:07:52
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z01T_EMPMAST....................................*
DATA:  BEGIN OF STATUS_Z01T_EMPMAST                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z01T_EMPMAST                  .
CONTROLS: TCTRL_Z01T_EMPMAST
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z01T_EMPMAST                  .
TABLES: Z01T_EMPMAST                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
