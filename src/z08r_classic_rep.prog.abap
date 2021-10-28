*&---------------------------------------------------------------------*
*& Report Z08R_CLASSIC_REP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z08R_CLASSIC_REP.

TABLES : MARA,MAKT.


PARAMETERS : MatType TYPE MARA-MTART.
SELECT-OPTIONS : MatNo FOR MARA-MATNR.
TYPES: BEGIN OF ty_structure,
  MaterialNo TYPE MARA-MATNR,
  CreatedOn TYPE MARA-ERSDA,
  NameOfPerson TYPE MARA-ERNAM,
  MaterialType TYPE MARA-MTART,
  IndustrySector TYPE MARA-MBRSH,
  MaterialDes TYPE MAKT-MAKTX,
  END OF ty_structure.

  DATA: wa_local TYPE ty_structure,
      ty_local type TABLE OF ty_structure.

  START-OF-SELECTION.
  SELECT mara~matnr mara~ersda mara~ernam mara~mtart mara~mbrsh makt~MAKTX INTO TABLE ty_local FROM MARA INNER JOIN MAKT ON ( MARA~MATNR = MAKT~MATNR ) WHERE  mtart = MatType AND mara~matnr IN MatNo.

 LOOP AT ty_local INTO wa_local.
 WRITE : wa_local-MaterialNo,
 wa_local-CreatedOn,
 wa_local-NameOfPerson,
 wa_local-MaterialType,
 wa_local-IndustrySector,
 wa_local-MaterialDes.



 NEW-LINE.                                "/NEW LINE
ENDLOOP.
