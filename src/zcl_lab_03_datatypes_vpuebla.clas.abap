CLASS zcl_lab_03_datatypes_vpuebla DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "Conversiones de Tipo
    DATA:   MV_CHAR  TYPE c LENGTH 10 VALUE '12345',
            MV_NUM   TYPE i,
            MV_FLOAT TYPE f.

    " Truncamiento y redondeo
    DATA:   MV_TRUNC TYPE i,
            MV_ROUND TYPE i.

    " Calculos de fecha y hora
    DATA:   MV_DATE_1 TYPE d VALUE '20241028',
            MV_DATE_2 TYPE d VALUE '20241128',
            MV_DAYS TYPE i,
            MV_TIME TYPE t,
            MV_TIMESTAMP TYPE utclong.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LAB_03_DATATYPES_VPUEBLA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*   Conversiones de tipo
    MV_NUM = MV_CHAR.
    MV_FLOAT = MV_CHAR.

    out->write( | Numero = { MV_NUM } { CL_ABAP_CHAR_UTILITIES=>NEWLINE } Flotante = { MV_FLOAT } | ).

*   Truncamiento y redondeo

    MV_FLOAT = '123.45'.
    MV_TRUNC = MV_FLOAT.
    MV_ROUND = MV_FLOAT + '0.5'.

    out->write( | Truncamiento = { MV_TRUNC } { CL_ABAP_CHAR_UTILITIES=>NEWLINE } Redondeo = { MV_ROUND } | ).

*   Declaracion en linea
    DATA(MV_ABAP) = 'ABAP'.
    out->write( | En Linea = { MV_ABAP } | ).

*   Conversiones del Tipo Forzado
    MV_NUM = CONV i( MV_CHAR ).
    out->write( | Conversion Forzada = { MV_NUM } | ).

*   Calculos Fecha y Hora
    MV_DAYS = MV_DATE_2 - MV_DATE_1.
    MV_TIME = cl_abap_context_info=>get_system_time(  ).
    DATA(MV_FORMATO) = cl_abap_context_info=>get_user_time_zone(  ).
    out->write( | Fecha A = { MV_DATE_1 } { CL_ABAP_CHAR_UTILITIES=>NEWLINE } Fecha B = { MV_DATE_2 } { CL_ABAP_CHAR_UTILITIES=>NEWLINE } Diferencia = { MV_DAYS } | ).
    out->write( | DD/MM/YYYY = { MV_DATE_1+6(2) }/{ MV_DATE_1+4(2) }/{ MV_DATE_1(4) }| ).

*   Campos Timestamp
    MV_TIMESTAMP = utclong_current(  ).
    MV_TIMESTAMP = utclong_add( val = MV_TIMESTAMP days = -2 ).
    CONVERT UTCLONG MV_TIMESTAMP TIME ZONE MV_FORMATO INTO DATE MV_DATE_2 TIME MV_TIME.
    out->write( | Fecha Actual -2 = { MV_DATE_2+6(2) }/{ MV_DATE_2+4(2) }/{ MV_DATE_2(4) }| ).
    out->write( | Hora Actual (UTC) = { MV_TIME(2) }:{ MV_TIME+2(2) }:{ MV_TIME+4(2) } { MV_FORMATO } | ).

  ENDMETHOD.
ENDCLASS.
