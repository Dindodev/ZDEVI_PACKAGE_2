*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 19.10.2018 at 02:31:12
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z01T_EMPMASTER..................................*
DATA:  BEGIN OF STATUS_Z01T_EMPMASTER                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z01T_EMPMASTER                .
CONTROLS: TCTRL_Z01T_EMPMASTER
            TYPE TABLEVIEW USING SCREEN '0010'.
*...processing: Z01T_EMPMASTER1.................................*
DATA:  BEGIN OF STATUS_Z01T_EMPMASTER1               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z01T_EMPMASTER1               .
CONTROLS: TCTRL_Z01T_EMPMASTER1
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: Z01T_EMPMASTER1C................................*
DATA:  BEGIN OF STATUS_Z01T_EMPMASTER1C              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z01T_EMPMASTER1C              .
CONTROLS: TCTRL_Z01T_EMPMASTER1C
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *Z01T_EMPMASTER                .
TABLES: *Z01T_EMPMASTER1               .
TABLES: *Z01T_EMPMASTER1C              .
TABLES: Z01T_EMPMASTER                 .
TABLES: Z01T_EMPMASTER1                .
TABLES: Z01T_EMPMASTER1C               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
