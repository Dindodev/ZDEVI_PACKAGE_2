class ZCX_12_POSO definition
  public
  inheriting from CX_STATIC_CHECK
  create private .

public section.

  interfaces IF_T100_DYN_MSG .
  interfaces IF_T100_MESSAGE .

  constants:
    begin of ZCX_12_POSO,
      msgid type symsgid value 'Z12MSG_CLASS',
      msgno type symsgno value '000',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ZCX_12_POSO .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_12_POSO IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = ZCX_12_POSO .
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.
ENDCLASS.
