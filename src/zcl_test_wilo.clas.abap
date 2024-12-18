CLASS zcl_test_wilo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "Esta interfaz es para generar un programa que corra en consola"
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_WILO IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
    "KEYWORD DATA: Las variables que va utilizar el método"
    DATA: lv_holamundo TYPE string VALUE 'HolaMundo',
          lv_numero TYPE i VALUE 1234,
          lv_fecha TYPE d,
          lv_decimal TYPE p LENGTH 8 DECIMALS 2 VALUE '12.34',
          lv_char TYPE c LENGTH 10 VALUE 'NUMERO DIE'. "Siempre para terminar las keywords se utiliza un punto"

   "Variables complejas, son estructuras parecidas a un diccionario"
   TYPES: BEGIN OF MTY_CUSTOMER,
            ID TYPE i,
            CUSTOMER TYPE c LENGTH 15,
            AGE TYPE i,
          END OF MTY_CUSTOMER,

          "Tipo ENUM sirve para crear estados intercambiables
          BEGIN OF ENUM MTY_STATUS,
            pagado,
            no_pagado,
          END OF ENUM MTY_STATUS.

    "Imprimir en consola"
    out->write( 'HOLA MUNDO' ).
    OUT->write( cl_abap_context_info=>get_system_time( ) ).
ENDMETHOD.
ENDCLASS.
