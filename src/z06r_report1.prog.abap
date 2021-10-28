*&---------------------------------------------------------------------*
*& Report Z06R_REPORT1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06r_report1.

TABLES: mara, makt.

TYPES: BEGIN OF ty_mara,
        mnumb   TYPE mara-matnr,
        mcreate TYPE mara-ersda,
        name    TYPE mara-ernam,
        mtype   TYPE mara-mtart,
        isector TYPE mara-mbrsh,
        mdesc   TYPE makt-maktx,
        end OF ty_mara.

data:   wa_mara     TYPE ty_mara,
        it_mara     TYPE TABLE OF ty_mara.

 select-options: s_matnr FOR mara-matnr OBLIGATORY.
 PARAMETERS: mtart type mara-mtart.

 select mara~matnr mara~ersda mara~ernam mara~mtart mara~mbrsh makt~maktx
   FROM mara INNER JOIN makt ON mara~matnr = makt~matnr INTO TABLE it_mara WHERE mara~matnr IN s_matnr AND mtart EQ mtart.

START-OF-SELECTION.
  SELECT matnr ersda ernam mtart mbrsh
      FROM mara
      INTO TABLE it_mara
    WHERE matnr IN s_matnr.

  LOOP AT it_mara INTO wa_mara.
    WRITE:/1  wa_mara-mnumb,
           20 wa_mara-mcreate,
           40 wa_mara-name,
           60 wa_mara-mtype,
           80 wa_mara-isector,
           100 wa_mara-mdesc.
  ENDLOOP.


TOP-OF-PAGE.
  WRITE:/1  'First Level of the report'.
  SKIP 5.
