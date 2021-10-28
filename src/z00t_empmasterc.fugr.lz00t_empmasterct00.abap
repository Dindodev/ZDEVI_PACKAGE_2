*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 05:48:52
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z00T_EMPMASTERC.................................*
DATA:  BEGIN OF STATUS_Z00T_EMPMASTERC               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z00T_EMPMASTERC               .
CONTROLS: TCTRL_Z00T_EMPMASTERC
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z00T_EMPMASTERC               .
TABLES: Z00T_EMPMASTERC                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
