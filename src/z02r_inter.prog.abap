*&---------------------------------------------------------------------*
*& Report Z02R_INTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z02R_INTER.

TABLES : VBAK,VBAP.


PARAMETERS : SOType TYPE VBAK-AUART.
SELECT-OPTIONS : SaleDoc FOR VBAK-VBELN.
TYPES: BEGIN OF ty_vbak,
  SalesDocType TYPE VBAK-AUART,
  SaleDoc TYPE VBAK-VBELN,
  NameOfPerson TYPE VBAK-ERNAM,
  NetValueOfSO TYPE VBAK-NETWR,

  END OF ty_vbak,

  BEGIN OF ty_vbap,
    SaleDoc TYPE VBAP-VBELN,
    SalesDocItem TYPE VBAP-POSNR,
    MaterialNo TYPE VBAP-MATNR,
    TargetQuantity TYPE VBAP-ZMENG,
    END OF ty_vbap.





  DATA: wa_vbak TYPE ty_vbak,
      it_vbak TYPE TABLE OF ty_vbak,
      wa_vbap TYPE ty_vbap,
      it_vbap TYPE TABLE OF ty_vbap.


  START-OF-SELECTION.
  SELECT auart vbeln ernam netwr FROM VBAK INTO TABLE it_vbak WHERE auart = SOType AND vbeln IN SaleDoc.

 LOOP AT it_vbak INTO wa_vbak.
 WRITE : wa_vbak-SalesDocType,
 wa_vbak-SaleDoc HOTSPOT,
 wa_vbak-NameOfPerson,
 wa_vbak-NetValueOfSO.
HIDE wa_vbak-SaleDoc.
 NEW-LINE.                                "/NEW LINE
ENDLOOP.

AT LINE-SELECTION.
    SELECT VBAK~VBELN  VBAP~POSNR VBAP~MATNR VBAP~ZMENG INTO TABLE it_vbap FROM VBAK INNER JOIN VBAP ON ( VBAK~VBELN = VBAP~VBELN ) WHERE  VBAK~VBELN = wa_vbak-SaleDoc.


        WRITE:/1 wa_vbak-SaleDoc.
        LOOP AT it_vbap INTO wa_vbap.
          WRITE:/10    wa_vbap-SaleDoc,
                 20    wa_vbap-SalesDocItem,
                 30    wa_vbap-MaterialNo,
                 wa_vbap-MaterialNo.

        ENDLOOP.
