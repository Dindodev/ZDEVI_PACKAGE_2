
REPORT z09p_interactive_report.

TABLES : vbak,vbap.


PARAMETERS : sotype TYPE vbak-auart.
SELECT-OPTIONS : saledoc FOR vbak-vbeln.
TYPES: BEGIN OF ty_vbak,
  salesdoctype TYPE vbak-auart,
  saledoc TYPE vbak-vbeln,
  nameofperson TYPE vbak-ernam,
  netvalueofso TYPE vbak-netwr,

  END OF ty_vbak,

  BEGIN OF ty_vbap,
    saledoc TYPE vbap-vbeln,
    salesdocitem TYPE vbap-posnr,
    materialno TYPE vbap-matnr,
    targetquantity TYPE vbap-zmeng,
    END OF ty_vbap.





  DATA: wa_vbak TYPE ty_vbak,
      it_vbak TYPE TABLE OF ty_vbak,
      wa_vbap TYPE ty_vbap,
      it_vbap TYPE TABLE OF ty_vbap.


  START-OF-SELECTION.
  SELECT auart vbeln ernam netwr FROM vbak INTO TABLE it_vbak WHERE auart = sotype AND vbeln IN saledoc.

 LOOP AT it_vbak INTO wa_vbak.
 WRITE : wa_vbak-salesdoctype,
 wa_vbak-saledoc HOTSPOT,
 wa_vbak-nameofperson,
 wa_vbak-netvalueofso.
HIDE wa_vbak-saledoc.
 NEW-LINE.                                "/NEW LINE
ENDLOOP.

AT LINE-SELECTION.
    SELECT vbak~vbeln  vbap~posnr vbap~matnr vbap~zmeng INTO TABLE it_vbap FROM vbak INNER JOIN vbap ON ( vbak~vbeln = vbap~vbeln ) WHERE  vbak~vbeln = wa_vbak-saledoc.


        WRITE:/1 wa_vbak-saledoc.
        LOOP AT it_vbap INTO wa_vbap.
          WRITE:/10    wa_vbap-saledoc,
                 20    wa_vbap-salesdocitem,
                 30    wa_vbap-materialno,
                 wa_vbap-materialno.

        ENDLOOP.
