CLASS zcl_lab_05_invoice_vpuebla DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "Concatenación
    DATA:   MV_EXERCISE(4) TYPE n VALUE '1234',
            MV_INVOICE_NO(8) TYPE n VALUE '567890',
            MV_INVOICE_CODE TYPE string.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_05_INVOICE_VPUEBLA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
      "Concatenación
      MV_INVOICE_CODE = MV_EXERCISE && '\' && MV_INVOICE_NO.
      out->write( MV_INVOICE_CODE ).

      "Concatenaciones de tablas
      SELECT FROM ZEMP_LOGALI
      FIELDS APE2
      INTO TABLE @DATA(LT_EMPLOYEES).

      out->write( concat_lines_of( table = LT_EMPLOYEES sep = ' ' ) ).
  ENDMETHOD.
ENDCLASS.
