*&---------------------------------------------------------------------*
*& Report Z04CR_CLASSICAL_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z04CR_CLASSICAL_REPORT.

Tables : mara.
Select-OPTIONS : p_num for  mara-matnr.
PARAMETERS : p_type type mara-mtart.

TYPES: BEGIN OF ty_mara,
  mnum type mara-matnr,
  created type mara-ersda,
  pname type mara-ernam,
  mtype type mara-mtart,
  sect type mara-mbrsh,
  END OF ty_mara.

 Data:  it_mara type TABLE OF ty_mara,
        lw_mara type ty_mara.

        START-OF-SELECTION.

        SELECT matnr ersda ernam mtart mbrsh from mara INTO TABLE it_mara where matnr in p_num and mtart eq p_type.


          LOOP AT it_mara INTO lw_mara.
            write lw_mara-mnum.
            write lw_mara-created.
            write lw_mara-pname.
            write lw_mara-sect.
           ENDLOOP.
