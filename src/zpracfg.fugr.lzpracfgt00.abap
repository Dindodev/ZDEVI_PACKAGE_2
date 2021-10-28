*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 07:57:10
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z06_EMPDETAILS..................................*
DATA:  BEGIN OF STATUS_Z06_EMPDETAILS                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z06_EMPDETAILS                .
CONTROLS: TCTRL_Z06_EMPDETAILS
            TYPE TABLEVIEW USING SCREEN '0003'.
*.........table declarations:.................................*
TABLES: *Z06_EMPDETAILS                .
TABLES: Z06_EMPDETAILS                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
