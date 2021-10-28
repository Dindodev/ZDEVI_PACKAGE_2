*&---------------------------------------------------------------------*
*& Report Z07R_ADOBEREPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z07r_adobereport.
TABLES : vbap.
SELECT-OPTIONS : lv_vbeln FOR vbap-vbeln.



DATA : it_vbap      TYPE ztt07_vbap,
       wa_vbap      TYPE zst07_vbap,
       fm_name      TYPE rs38l_fnam,
        fp_docparams      TYPE sfpdocparams,
         fp_outputparams   TYPE sfpoutputparams.



CALL FUNCTION 'FP_JOB_OPEN'
  CHANGING
    ie_outputparams = fp_outputparams
  EXCEPTIONS
    cancel          = 1
    usage_error     = 2
    system_error    = 3
    internal_error  = 4
    OTHERS          = 5.
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
  EXPORTING
    i_name     = 'Z07_EXERFORM'
IMPORTING
    e_funcname = fm_name
*   E_INTERFACE_TYPE           =
*   EV_FUNCNAME_INBOUND        =
  .
SELECT       vbeln posnr matnr arktx FROM vbap INTO TABLE it_vbap WHERE vbeln IN lv_vbeln.
CALL FUNCTION '/1BCDWB/SM00000069'
  EXPORTING
    /1bcdwb/docparams = fp_docparams
    it_vbap           = it_vbap
* IMPORTING
*   /1BCDWB/FORMOUTPUT       =
  EXCEPTIONS
    usage_error       = 1
    system_error      = 2
    internal_error    = 3
    OTHERS            = 4.
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

CALL FUNCTION 'FP_JOB_CLOSE'
* IMPORTING
*   E_RESULT             =
* EXCEPTIONS
*   USAGE_ERROR          = 1
*   SYSTEM_ERROR         = 2
*   INTERNAL_ERROR       = 3
*   OTHERS               = 4
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
