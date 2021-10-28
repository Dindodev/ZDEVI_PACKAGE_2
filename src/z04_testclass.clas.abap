class Z04_TESTCLASS definition
  public
  create public .

public section.
protected section.
private section.

  methods SELECT
    importing
      !LV_FLIGHT type SFLIGHT .
  methods DISPLAY .
ENDCLASS.



CLASS Z04_TESTCLASS IMPLEMENTATION.


  method DISPLAY.
  endmethod.


  method SELECT.
    data:es_Flight type  sflight.
    data:iv_carrid type sflight-carrid.
    Select SINGLE * from sflight into es_Flight where carrid = iv_carrid.

  endmethod.
ENDCLASS.
