*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_Z07F_USERINFO
*   generation date: 22.10.2018 at 10:32:13
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_Z07F_USERINFO      .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
