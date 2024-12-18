CLASS zcl_lab_01_var_vicentepuebla DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_01_VAR_VICENTEPUEBLA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Variables elementales"
    DATA: mv_purchase_date TYPE d,
          mv_purchase_time TYPE t,
          mv_price         TYPE f VALUE '10.5',
          mv_tax           TYPE i VALUE 16,
          mv_increase      TYPE decfloat16 VALUE '20.5',
          mv_discounts     TYPE decfloat34 VALUE '10.5',
          mv_type          TYPE c LENGTH 10 VALUE 'PC',
          mv_shipping      TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36',
          mv_id_code       TYPE n LENGTH 4 VALUE '1110',
          mv_qr_code       TYPE x LENGTH 5 VALUE 'F5CF'.

    mv_purchase_date =  cl_abap_context_info=>get_system_date( ).
    mv_purchase_time =  cl_abap_context_info=>get_system_time( ).

    "Variables complejas"
    TYPES: BEGIN OF mty_customer,
             id       TYPE i,
             customer TYPE c LENGTH 15,
             age      TYPE i,
           END OF mty_customer.

    DATA ls_customer TYPE mty_customer.
    ls_customer = VALUE #(  id = 1
                            customer = 'VICENTE'
                            age = 23 ).

    "Variables de referencia"
    DATA ms_employees TYPE REF TO /dmo/employee_hr.

    "Objetos de datos"
    DATA: mv_product  TYPE string VALUE 'Laptop',
          mv_bar_code TYPE xstring VALUE '12121 121211'.

    "Copias constantes"
    CONSTANTS: mc_price     TYPE f VALUE '10.5',
               mc_tax       TYPE i VALUE 16,
               mc_increase  TYPE decfloat16 VALUE '20.5',
               mc_discounts TYPE decfloat34 VALUE '10.5',
               mc_type      TYPE c LENGTH 10 VALUE 'PC',
               mc_shipping  TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36',
               mc_id_code   TYPE n LENGTH 4 VALUE '1110',
               mc_qr_code   TYPE x LENGTH 5 VALUE 'F5CF',
               mc_product   TYPE string VALUE 'Laptop',
               mc_bar_code  TYPE xstring VALUE '12121 121211'.

    CONSTANTS: BEGIN OF mtc_customer,
                 id       TYPE i VALUE 1,
                 customer TYPE c LENGTH 15 VALUE 'VICENTE',
                 age      TYPE i VALUE 23,
               END OF mtc_customer.

    "Declaraciones en línea"
    DATA(lv_product)    = mv_product.
    DATA(lv_bar_code)   = mv_bar_code.

    out->write( | FECHA: { mv_purchase_date } HORA: { mv_purchase_time } | ).
    out->write( | ID: { ls_customer-id } CUSTOMER: { ls_customer-customer } AGE: { ls_customer-age } | ).

  ENDMETHOD.
ENDCLASS.
