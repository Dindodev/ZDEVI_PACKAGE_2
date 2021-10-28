class ZCX_09_EXCEPTION definition
  public
  inheriting from CX_STATIC_CHECK
  create public .

public section.

  interfaces IF_T100_DYN_MSG .
  interfaces IF_T100_MESSAGE .

  data MSGID type MSGID .
  data MSGTYP type MSGTYP .
  data MSGNO type MSGNO .
  data MSG1 type MSGV1 .
  data MSG2 type MSGV2 .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !MSGID type MSGID optional
      !MSGTYP type MSGTYP optional
      !MSGNO type MSGNO optional
      !MSG1 type MSGV1 optional
      !MSG2 type MSGV2 optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_09_EXCEPTION IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
me->MSGID = MSGID .
me->MSGTYP = MSGTYP .
me->MSGNO = MSGNO .
me->MSG1 = MSG1 .
me->MSG2 = MSG2 .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = IF_T100_MESSAGE=>DEFAULT_TEXTID.
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.
ENDCLASS.
