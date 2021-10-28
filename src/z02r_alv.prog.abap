*&---------------------------------------------------------------------*
*& Report Z02R_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z02R_ALV.


TABLES : mara , marc , mard.  "tables defination

PARAMETERS : mtype TYPE mara-mtart.   "Parameter defination

SELECT-OPTIONS : matno FOR mara-matnr.  "Select option

TYPES : BEGIN OF ty_struct,
     matnr like mara-matnr,
     werks like marc-werks,
     lgort like mard-lgort,
     mtart like mara-mtart,
     ersda like mara-ersda,
     ernam like mara-ernam,
     xchar like marc-xchar,
     maktx like makt-maktx,
       END OF ty_struct.


DATA : l_tab type table of ty_struct,
      lw_wa type ty_struct.


DATA:I_FIELDCAT TYPE SLIS_T_FIELDCAT_ALV WITH HEADER LINE.


SELECT mara~matnr
      marc~werks
      mard~lgort
      mara~mtart
      mara~ersda
      mara~ernam
      marc~xchar
      makt~maktx
   INTO CORRESPONDING FIELDS OF TABLE l_tab
   FROM mara INNER JOIN marc ON ( mara~matnr = marc~matnr )
             INNER JOIN mard ON ( mara~matnr = mard~matnr )
             INNER JOIN makt ON ( mara~matnr = makt~matnr )
    WHERE mara~matnr IN matno AND mara~mtart = mtype .


   I_FIELDCAT-COL_POS = 1.
 I_FIELDCAT-FIELDNAME = 'MATNR'.
 I_FIELDCAT-TABNAME = 'l_tab'.
 I_FIELDCAT-REF_FIELDNAME = 'MATNR'.
 I_FIELDCAT-REF_TABNAME = 'mara'.
 I_FIELDCAT-KEY = 'X'.
 I_FIELDCAT-SELTEXT_M = 'MATERIAL NUMBER'.
 I_FIELDCAT-OUTPUTLEN = 20.
 APPEND I_FIELDCAT TO I_FIELDCAT.
 CLEAR I_FIELDCAT.


 I_FIELDCAT-COL_POS = 2.
 I_FIELDCAT-FIELDNAME = 'WERKS'.
 I_FIELDCAT-TABNAME = 'l_tab'.
 I_FIELDCAT-REF_FIELDNAME = 'WERKS'.
 I_FIELDCAT-REF_TABNAME = 'MARC'.
 I_FIELDCAT-KEY = ''.
 I_FIELDCAT-SELTEXT_M = 'PLANT'.
 APPEND I_FIELDCAT TO I_FIELDCAT.
 CLEAR I_FIELDCAT.


 I_FIELDCAT-COL_POS = 3.
 I_FIELDCAT-FIELDNAME = 'LGORT'.
 I_FIELDCAT-TABNAME = 'l_tab'.
 I_FIELDCAT-REF_FIELDNAME = 'LGORT'.
 I_FIELDCAT-REF_TABNAME = 'MARD'.
 I_FIELDCAT-KEY = ''.
 I_FIELDCAT-SELTEXT_M = 'STORAGE LOCATION'.
 I_FIELDCAT-OUTPUTLEN = 20.
 APPEND I_FIELDCAT TO I_FIELDCAT.
 CLEAR I_FIELDCAT.


  I_FIELDCAT-COL_POS = 4.
 I_FIELDCAT-FIELDNAME = 'MTART'.
 I_FIELDCAT-TABNAME = 'l_tab'.
 I_FIELDCAT-REF_FIELDNAME = 'MTART'.
 I_FIELDCAT-REF_TABNAME = 'MARA'.
 I_FIELDCAT-KEY = ''.
 I_FIELDCAT-SELTEXT_M = 'Material Type'.
 I_FIELDCAT-OUTPUTLEN = 20.
 APPEND I_FIELDCAT TO I_FIELDCAT.
 CLEAR I_FIELDCAT.


 I_FIELDCAT-COL_POS = 5.
