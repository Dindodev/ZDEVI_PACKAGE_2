*&---------------------------------------------------------------------*
*& Report Z03R_ASSIGNMENT_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03R_ASSIGNMENT_1.

Parameters : lp_par1 type i OBLIGATORY,
             lp_par2 type i OBLIGATORY,
             lp_op type c.


data lv_result type i.

case lp_op.
  when '+'.
    lv_result = lp_par1 + lp_par2.
    write 'The Summation is = '.
    write lv_result.
  when '-'.
    lv_result = lp_par1 - lp_par2.
    write 'The Difference is = '.
    write lv_result.
  when '*'.
    lv_result = lp_par1 * lp_par2.
    write 'The Multiplication is = '.
    write lv_result.
  when '/'.
    if lp_par2 is initial.
      message 'second parameter should not be blank' type 'E'.
    elseif lp_par2 = 0.
      message 'divide by zero is not applicable' type 'E'.
    else.
      lv_result = lp_par1 / lp_par2.
      write 'The Division is = '.
      write lv_result.
ENHANCEMENT-POINT Z03_EXP_ENHCMNT SPOTS Z03_IMP_EXP STATIC .
MESSAGE 'EXPLICIT ENHANCEMENT IS DONE -  TEST PURPOSE ONLY - SUBHASHINI ' TYPE 'S'.


    endif.
endcase.
