*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_Z11T_EMPMASTE_FG
*   generation date: 08.10.2018 at 10:32:57
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_Z11T_EMPMASTE_FG   .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
