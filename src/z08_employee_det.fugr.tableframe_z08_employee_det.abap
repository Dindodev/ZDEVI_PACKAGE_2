*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_Z08_EMPLOYEE_DET
*   generation date: 08.10.2018 at 07:46:54
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_Z08_EMPLOYEE_DET   .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
