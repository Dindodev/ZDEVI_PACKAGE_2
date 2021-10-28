*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_Z09T_EMPLOYEE_DE
*   generation date: 08.10.2018 at 07:17:43
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_Z09T_EMPLOYEE_DE   .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
