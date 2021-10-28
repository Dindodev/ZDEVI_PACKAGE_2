*&---------------------------------------------------------------------*
*& Report Z01R_TRAINING_PROGRAM5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01r_training_program5.

TABLES : mara ,makt . "include tbales



TYPES: BEGIN OF ty_mara,            " structure defination of combination of tables
        mnumb   TYPE mara-matnr,
        mcreate TYPE mara-ersda,
        name    TYPE mara-ernam,
        mtype   TYPE mara-mtart,
        isector TYPE mara-mbrsh,
        mdesc   TYPE makt-maktx,
        end OF ty_mara.

data:   wa_mara     TYPE ty_mara,                 " work area and intenal table defnation
        it_mara     TYPE TABLE OF ty_mara.

 select-options: s_matnr FOR mara-matnr OBLIGATORY.            "select options and makiung them obligatory
 PARAMETERS: mtart type mara-mtart.

 select mara~matnr mara~ersda mara~ernam mara~mtart mara~mbrsh makt~maktx
   FROM mara INNER JOIN makt ON mara~matnr = makt~matnr INTO TABLE it_mara WHERE mara~matnr IN s_matnr AND mtart EQ mtart.  "query using end joins

START-OF-SELECTION.
  SELECT matnr ersda ernam mtart mbrsh
      FROM mara
      INTO TABLE it_mara
    WHERE matnr IN s_matnr.

  WRITE : /1 'Material No' COLOR 1,          "Headers for list
         20 'Price' COLOR 2,
         40   'Material Name' COLOR 3,
         60  'Material Type' COLOR 4,
         80 'Industry Sector ' color 5,
         100 'Material description' color 6.

  LOOP AT it_mara INTO wa_mara.
    WRITE:/1  wa_mara-mnumb color 1,           " write report
           20 wa_mara-mcreate color 2,
           40 wa_mara-name color 3 ,
           60 wa_mara-mtype color 4,
           80 wa_mara-isector color 5,
           100 wa_mara-mdesc color 6 .
  ENDLOOP.


TOP-OF-PAGE.
  WRITE:/1  'First Level of the report'.
  SKIP 5.
