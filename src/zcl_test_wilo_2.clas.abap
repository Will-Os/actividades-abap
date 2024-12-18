CLASS zcl_test_wilo_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: lv_num_a TYPE i VALUE 20,
          lv_num_b TYPE i VALUE 10,
          lv_num_c TYPE p LENGTH 6 DECIMALS 2.
    INTERFACES:  if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_WILO_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "Suma: Puede ser ocupado un operador ADD el cual está desfazado.

    out->write( | NUM 1: { lv_num_a } / NUM 2: { lv_num_b } | ).
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } SUMA: { lv_num_a + lv_num_b } | ).

    lv_num_c += '5.3'.
    lv_num_c += 1.
    out->write( | ACUMULADOR: { lv_num_c } | ).

    "Resta: Puede ser utilizado SUBSTRACT el cual esta desfazado.

    lv_num_c -= 1.
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } RESTA: { lv_num_a - lv_num_b } | ).
    out->write( | ACUMULADOR: { lv_num_c } | ).

    "Multiplicacion: Puede ser utilizado MULTIPLY el cual esta desfazado.

    lv_num_c *= 2.
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } MULTIPLICACION: { lv_num_a * lv_num_b } | ).
    out->write( | ACUMULADOR: { lv_num_c } | ).

    "Division: Puede ser utilizado DIVIDE el cual esta desfazado.

    lv_num_c /= 2.
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } DIVISION: { lv_num_a / lv_num_b } | ).
    out->write( | DIVISION (SIN RESTO): { lv_num_a DIV lv_num_b } | ). "En este caso no se nota el resto porque son solo enteros
    out->write( | RESIDUO: { lv_num_b MOD lv_num_a } | ). "Similar al operador %
    out->write( | ACUMULADOR: { lv_num_c } | ).

    "Exponienciacion: Puede ser utilizado IPOW.
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } EXPONIENCIACION: { lv_num_b ** 3 } | ).

    "Raiz Cuadrada: SQRT(variable).
    out->write( | RAIZ CUADRADA: { SQRT( lv_num_a ) } | ).

    "NOTA: con DATA() se pueden realizar declaraciones en la misma línea: DATA(lv_variable) = 'HOLA'
  ENDMETHOD.
ENDCLASS.
