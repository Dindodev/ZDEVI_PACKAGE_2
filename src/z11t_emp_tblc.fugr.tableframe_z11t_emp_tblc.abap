*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_Z11T_EMP_TBLC
*   generation date: 08.10.2018 at 06:53:40
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_Z11T_EMP_TBLC      .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
