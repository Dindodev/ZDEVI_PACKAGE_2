*&---------------------------------------------------------------------*
*& Report z_demo
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_demo.

class lcl_ definition create private.

  public section.
    CLASS-METHODS create
      RETURNING
        value(r_result) TYPE REF TO lcl_.
        methods run.
  protected section.
  private section.

endclass.

class lcl_ implementation.

  method create.

    create object r_result.

  endmethod.

  method run.
    WRITE : 'HELLO WORLD'.
  endmethod.

endclass.

START-OF-SELECTION .
lcl_=>create( )->run( ).
