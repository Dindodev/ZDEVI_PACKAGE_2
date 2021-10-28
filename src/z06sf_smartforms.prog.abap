*&---------------------------------------------------------------------*
*& Report Z06SF_SMARTFORMS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z06SF_SMARTFORMS.

TABLES: Ekko,ekpo.

SELECT-OPTIONS: s_mat FOR ekpo-matnr OBLIGATORY.
PARAMETERS: p_mtype TYPE ekko-ebeln OBLIGATORY.

TYPES: BEGIN OF ty_ekko,
         ebeln TYPE ekko-ebeln,
         bstyp TYPE ekko-bstyp,
         ekorg TYPE ekko-ekorg,
         lifnr TYPE ekko-lifnr,
         bedat TYPE ekko-bedat,
         ernam TYPE ekko-ernam,

       END OF ty_ekko.

TYPES: BEGIN OF ty_ekpo,
         ebeln TYPE ekpo-ebeln,
         ebelp TYPE ekpo-ebelp,
         matnr TYPE ekpo-matnr,
         werks TYPE ekpo-werks,
         menge TYPE ekpo-menge,
         meins TYPE ekpo-meins,

       END OF ty_ekpo.

DATA: lt_ekko TYPE TABLE OF ty_ekko,
      lw_ekko TYPE ty_ekko.

DATA: lt_ekpo TYPE TABLE OF ty_ekpo,
      fin_ekpo TYPE TABLE OF ty_ekpo,
      lw_ekpo TYPE ty_ekpo.

 START-OF-SELECTION.

*      SELECT ebeln bstyp ekorg lifnr bedat into table lt_ekko from ekko where ekpo-ebeln eq p_mtype.

* if it_ekko[] is NOT INITIAL.
*
* SELECT ebeln ebelp matnr werks menge meins from ekpo into table lt_ekpo
*   FOR ALL ENTRIES IN lt_ekko WHERE ebeln = lt_ekko-ebeln AND matnr in s_mat.
*
*   ENDIF.
