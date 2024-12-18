CLASS zcl_lab_04_message_vpuebla DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA:   LV_ORDER_STATUS TYPE string VALUE 'Purchase Completed Successfully',
            LV_CHAR_NUMBER  TYPE i,
            LV_PATTERN TYPE string VALUE '\d{3}-\d{3}-\d{4}',
            LV_PHONE TYPE string VALUE 'Numero: 123-456-7890',
            LV_EMAIL TYPE string VALUE 'vpuebla@abap.cl'.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_04_MESSAGE_VPUEBLA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " Simbolos de texto
    out->write( text-001 ).

    "Funciones de descripción
    LV_CHAR_NUMBER = STRLEN( LV_ORDER_STATUS ).
    out->write( |Cantidad Caracteres (STRLEN) = { LV_CHAR_NUMBER }| ).
    LV_CHAR_NUMBER = NUMOFCHAR( LV_ORDER_STATUS ).
    out->write( |Cantidad Caracteres (NUMOFCHAR) = { LV_CHAR_NUMBER }| ).
    LV_CHAR_NUMBER = FIND( val = LV_ORDER_STATUS sub = 'Exit' ).
    out->write( |Posicion 'Exit' = { LV_CHAR_NUMBER }| ).

    "Funciones de procesamiento
    out->write( |{ to_upper( LV_ORDER_STATUS ) }| ).
    out->write( |{ to_lower( LV_ORDER_STATUS ) }| ).
    out->write( |{ to_mixed( LV_ORDER_STATUS ) }| ).
    out->write( |{ shift_left( val = LV_ORDER_STATUS circular = 9 ) }| ).
    out->write( |{ substring_from( val = LV_ORDER_STATUS sub = 'Completed' len = 9 ) }| ).

    "Regex
    IF contains( val = LV_PHONE pcre = LV_PATTERN ).
        out->write( |Patron Contiene numero| ).
    ELSE.
        out->write( |Patron No contiene numero| ).
    ENDIF.

    LV_PATTERN = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'.
    IF contains( val = LV_EMAIL pcre = LV_PATTERN ).
        out->write( |Patron Contiene mail| ).
    ELSE.
        out->write( |Patron No contiene mail| ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
