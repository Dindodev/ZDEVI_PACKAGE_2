*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 25.04.2019 at 06:28:33
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z08T_FREIGHT_NO.................................*
DATA:  BEGIN OF STATUS_Z08T_FREIGHT_NO               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z08T_FREIGHT_NO               .
CONTROLS: TCTRL_Z08T_FREIGHT_NO
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z08T_FREIGHT_NO               .
TABLES: Z08T_FREIGHT_NO                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
