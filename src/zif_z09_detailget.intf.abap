interface ZIF_Z09_DETAILGET
  public .


  methods GET_DETAILS
    importing
      !I_PONO type EBELN
      !I_SONO type VBELN
    exporting
      !E_EKKO type Z09_PO
      !E_VBAK type Z09_SO
    raising
      ZCX_09_EXCEPTION .
  methods DISPLAY_DETAILS
    importing
      !E_EKKO type Z09_PO
      !E_VBAK type Z09_SO .
endinterface.
