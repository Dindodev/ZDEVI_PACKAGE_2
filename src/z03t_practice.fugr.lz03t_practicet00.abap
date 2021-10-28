*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 07:13:41
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z03T_PRACTICE...................................*
DATA:  BEGIN OF STATUS_Z03T_PRACTICE                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z03T_PRACTICE                 .
CONTROLS: TCTRL_Z03T_PRACTICE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z03T_PRACTICE                 .
TABLES: Z03T_PRACTICE                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
