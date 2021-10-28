*&---------------------------------------------------------------------*
*& Report Z05R_ALV_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z05R_ALV_REPORT.
TABLES: mara, marc, mard, makt.

* pools slis
TYPE-POOLS slis.

* Defining the structure
TYPES: BEGIN OF ty_structure,
         matnr TYPE mara-matnr,
         werks TYPE marc-werks,
         lgort TYPE mard-lgort,
         mtart TYPE mara-mtart,
         ersda TYPE mara-ersda,
         ernam TYPE mara-ernam,
         xchar TYPE marc-xchar,
         maktx  TYPE makt-maktx,
       END OF ty_structure.

*Data , work area, internal tables, layout, field catalog, header
DATA: wa_str     TYPE ty_structure,
      it_str     TYPE TABLE OF ty_structure,
      report_id  LIKE sy-repid,
      ws_title   TYPE lvc_title VALUE 'ALV REPORT',
      i_layout   TYPE slis_layout_alv,
      i_fieldcat TYPE slis_t_fieldcat_alv,
      i_header   TYPE slis_t_listheader,
      i_events   TYPE slis_t_event.

* screen input
PARAMETERS : p_mtart TYPE mara-mtart OBLIGATORY.
SELECT-OPTIONS: s_matnr FOR mara-matnr.




*Start of Selection
START-OF-SELECTION.

  SELECT mara~matnr marc~werks mard~lgort mara~mtart mara~ersda mara~ernam marc~xchar makt~maktx
    FROM mara INNER JOIN marc  ON mara~matnr = marc~matnr
              INNER JOIN mard ON mara~matnr = mard~matnr
              INNER JOIN makt ON mara~matnr = makt~matnr
              INTO CORRESPONDING FIELDS OF TABLE it_str
    WHERE mara~mtart = p_mtart AND mara~matnr IN s_matnr.

  IF sy-subrc NE 0.
    MESSAGE 'Data could not be fetched from the table.' TYPE 'E'.
  ENDIF.

END-OF-SELECTION.


* taking report ID
  report_id = sy-repid.

* Layout of the grid
  PERFORM layout_report  CHANGING i_layout.
* Field Catalogs creation
  PERFORM field_cat  CHANGING i_fieldcat.
*  Creating Header of the report
  PERFORM build_header CHANGING i_header.
*  Calling event to put hedaer in Top-Of-Page
  PERFORM events_init CHANGING i_events.



* grid function module

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK  = ' '
*     i_bypassing_buffer = 'X'
*     I_BUFFER_ACTIVE    = ' '
      i_callback_program = report_id
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
*     I_CALLBACK_TOP_OF_PAGE            = 'TOP_OF_PAGE'   "always in capital letters
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME   =
*     I_BACKGROUND_ID    = ' '
*     i_grid_title       = ws_title
*     I_GRID_SETTINGS    =
      is_layout          = i_layout
      it_fieldcat        = i_fieldcat
*     IT_EXCLUDING       =
*     IT_SPECIAL_GROUPS  =
*     IT_SORT            =
*     IT_FILTER          =
*     IS_SEL_HIDE        =
*     I_DEFAULT          = 'X'
      i_save             = 'A'
*     IS_VARIANT         =
      it_events          = i_events
*     IT_EVENT_EXIT      =
*     IS_PRINT           =
*     IS_REPREP_ID       =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE  = 0
*     I_HTML_HEIGHT_TOP  = 0
*     I_HTML_HEIGHT_END  = 0
*     IT_ALV_GRAPHICS    =
*     IT_HYPERLINK       =
*     IT_ADD_FIELDCAT    =
*     IT_EXCEPT_QINFO    =
*     IR_SALV_FULLSCREEN_ADAPTER        =
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      t_outtab           = it_str
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.
  IF sy-subrc <> 0.
    MESSAGE 'Data could not be displayed. error in grid functin module' TYPE 'E'.
  ENDIF.


*&---------------------------------------------------------------------*
*& Form header_report
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Form LAYOUT_REPORT
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      <-- I_LAYOUT
*&---------------------------------------------------------------------*
FORM layout_report  CHANGING p_i_layout TYPE slis_layout_alv.
  CLEAR i_layout.
  i_layout-colwidth_optimize = 'X'.
  i_layout-edit = 'X'.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form FIELD_CAT
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      <-- I_FIELDCAT
*&---------------------------------------------------------------------*
FORM field_cat  CHANGING p_i_fieldcat TYPE slis_t_fieldcat_alv.
  DATA: line_fieldcat TYPE slis_fieldcat_alv.
  CLEAR line_fieldcat.

  line_fieldcat-fieldname = 'matnr'. " The field name and the table
  line_fieldcat-tabname = 'I_DATA'. " name are the two minimum req.
  line_fieldcat-key = 'X'. " Specifies the column as a key (Blue)
  line_fieldcat-seltext_m = 'Material No.'. " Column Header
  APPEND line_fieldcat TO i_fieldcat.
  CLEAR line_fieldcat.

  line_fieldcat-fieldname = 'werks'. " The field name and the table
  line_fieldcat-tabname = 'I_DATA'. " name are the two minimum req.
  line_fieldcat-key = 'X'. " Specifies the column as a key (Blue)
  line_fieldcat-seltext_m = 'Plant'. " Column Header
  APPEND line_fieldcat TO i_fieldcat.
  CLEAR line_fieldcat.

  line_fieldcat-fieldname = 'lgort'. " The field name and the table
  line_fieldcat-tabname = 'I_DATA'. " name are the two minimum req.
  line_fieldcat-key = ''. " Specifies the column as a key (Blue)
  line_fieldcat-seltext_m = 'Storage Location'. " Column Header
  APPEND line_fieldcat TO i_fieldcat.
  CLEAR line_fieldcat.

  line_fieldcat-fieldname = 'mtart'. " The field name and the table
  line_fieldcat-tabname = 'I_DATA'. " name are the two minimum req.
  line_fieldcat-key = ''. " Specifies the column as a key (Blue)
  line_fieldcat-seltext_m = 'Material Type'. " Column Header
  APPEND line_fieldcat TO i_fieldcat.
  CLEAR line_fieldcat.

  line_fieldcat-fieldname = 'ersda'. " The field name and the table
  line_fieldcat-tabname = 'I_DATA'. " name are the two minimum req.
  line_fieldcat-key = ''. " Specifies the column as a key (Blue)
  line_fieldcat-seltext_m = 'Date'. " Column Header
  APPEND line_fieldcat TO i_fieldcat.
  CLEAR line_fieldcat.

  line_fieldcat-fieldname = 'ernam'. " The field name and the table
  line_fieldcat-tabname = 'I_DATA'. " name are the two minimum req.
  line_fieldcat-key = ''. " Specifies the column as a key (Blue)
  line_fieldcat-seltext_m = 'Name'. " Column Header
  APPEND line_fieldcat TO i_fieldcat.
  CLEAR line_fieldcat.

  line_fieldcat-fieldname = 'xchar'. " The field name and the table
  line_fieldcat-tabname = 'I_DATA'. " name are the two minimum req.
  line_fieldcat-key = ''. " Specifies the column as a key (Blue)
  line_fieldcat-seltext_m = 'Batch No.'. " Column Header
  APPEND line_fieldcat TO i_fieldcat.
  CLEAR line_fieldcat.

  line_fieldcat-fieldname = 'maktx'. " The field name and the table
  line_fieldcat-tabname = 'I_DATA'. " name are the two minimum req.
  line_fieldcat-key = ''. " Specifies the column as a key (Blue)
  line_fieldcat-seltext_m = 'Material Description'. " Column Header
  APPEND line_fieldcat TO i_fieldcat.
  CLEAR line_fieldcat.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form EVENT_HEADER
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      <-- I_EVENTS
*&---------------------------------------------------------------------*
FORM event_header  CHANGING p_i_events.
  DATA: line_event TYPE slis_alv_event.
  CLEAR line_event.
  line_event-name = 'TOP_OF_PAGE'.
  line_event-form = 'TOP_OF_PAGE'.
  APPEND line_event TO i_events.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form build Header
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      <-- I_EVENTS
*&---------------------------------------------------------------------*
FORM build_header  USING i_header TYPE slis_t_listheader.

  DATA: gs_line TYPE slis_listheader.
  CLEAR gs_line.
  gs_line-typ = 'H'.
  gs_line-info = 'Material Detail Report'.
  APPEND gs_line TO i_header.
  CLEAR gs_line.

  gs_line-typ = 'S'.

  gs_line-key = 'Report : '.
  gs_line-info = report_id.
  APPEND gs_line TO i_header.


  gs_line-key = 'User Name : '.
  gs_line-info = sy-uname.
  APPEND gs_line TO i_header.


  gs_line-key = 'Date : '.
  gs_line-info = sy-datum.
  APPEND gs_line TO i_header.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form EVENTS_INIT
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      <-- I_EVENTS
*&---------------------------------------------------------------------*
FORM events_init CHANGING i_events TYPE slis_t_event.
  DATA: line_event TYPE slis_alv_event.
  CLEAR line_event.
  line_event-name = 'TOP_OF_PAGE'.
  line_event-form = 'F_TOP_OF_PAGE'.
  APPEND line_event TO i_events.
ENDFORM.

*---------------------------------------------------------------------*
* FORM F4100_TOP_OF_PAGE *
*---------------------------------------------------------------------*
FORM f_top_of_page.
  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = i_header.
ENDFORM.
