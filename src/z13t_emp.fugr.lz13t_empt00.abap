*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 08.10.2018 at 07:39:38
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z13T_EMP........................................*
DATA:  BEGIN OF STATUS_Z13T_EMP                      .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z13T_EMP                      .
CONTROLS: TCTRL_Z13T_EMP
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z13T_EMP                      .
TABLES: Z13T_EMP                       .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
