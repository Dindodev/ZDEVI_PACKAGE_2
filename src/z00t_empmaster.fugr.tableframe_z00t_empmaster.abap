*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_Z00T_EMPMASTER
*   generation date: 08.10.2018 at 05:53:49
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_Z00T_EMPMASTER     .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
