*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 02.11.2018 at 00:29:31
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: Z01TABLE........................................*
DATA:  BEGIN OF STATUS_Z01TABLE                      .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_Z01TABLE                      .
CONTROLS: TCTRL_Z01TABLE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *Z01TABLE                      .
TABLES: Z01TABLE                       .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
