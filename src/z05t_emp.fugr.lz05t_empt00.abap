*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 10/08/2018 at 13:46:44
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z05T_EMP........................................*
DATA:  BEGIN OF STATUS_Z05T_EMP                      .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z05T_EMP                      .
CONTROLS: TCTRL_Z05T_EMP
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z05T_EMP                      .
TABLES: Z05T_EMP                       .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
