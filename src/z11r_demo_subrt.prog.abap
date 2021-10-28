*&---------------------------------------------------------------------*
*& Report Z11R_DEMO_SUBRT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

REPORT Z11R_DEMO_SUBRT.
DATA: v_First TYPE i,
      v_Second TYPE i,
      v_Operation(1) TYPE c,
      v_Result  TYPE i.


WRITE : /1 'arthmetic operations on 4 and 2 :'.

v_First = 4. v_Second = 2. v_Operation = '+'.
PERFORM calc_Operations using v_First v_Second v_Operation CHANGING v_Result.
WRITE : /1 'Addition', v_Result.

v_First = 4. v_Second = 2. v_Operation = '-'.
PERFORM calc_Operations using v_First v_Second v_Operation CHANGING v_Result.
WRITE : /1 'Substration', v_Result.

v_First = 4. v_Second = 2. v_Operation = '*'.
PERFORM calc_Operations using v_First v_Second v_Operation CHANGING v_Result.
WRITE : /1 'Multiplication', v_Result.

v_First = 4. v_Second = 2. v_Operation = '/'.
PERFORM calc_Operations using v_First v_Second v_Operation CHANGING v_Result.
WRITE : /1 'Division', v_Result.

*&---------------------------------------------------------------------*
*& Form CALC_OPERATIONS
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> V_FIRST
*&      --> V_SECOND
*&      <-- V_RESULT
*&---------------------------------------------------------------------*
FORM calc_operations  USING    p_v_first
                               p_v_second
                               v_Operation
                      CHANGING p_v_result.
  CASE v_Operation.
    WHEN '+'.
      p_v_result =  p_v_first + p_v_second.
    WHEN '-'.
       p_v_result =  p_v_first - p_v_second.
    WHEN '*'.
       p_v_result =  p_v_first * p_v_second.
    WHEN '/'.
       p_v_result =  p_v_first / p_v_second.
    WHEN OTHERS.
  ENDCASE.



ENDFORM.
