*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_Z09T_EMPLOYEE
*   generation date: 25.10.2018 at 07:19:34
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_Z09T_EMPLOYEE      .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
