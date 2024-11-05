CLASS zcl_lab_02_arithmetic_vpuebla DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "Sumas
    DATA:   LV_BASE_RATE TYPE i VALUE 20,
            LV_CORP_AREA_RATE TYPE i VALUE 10,
            LV_MEDICAL_SERVICE_RATE TYPE i VALUE 15,
            LV_TOTAL_RATE TYPE i.

    "Restas
    DATA:   LV_MAINTENANCE_RATE TYPE i VALUE 30,
            LV_MARGIN_RATE TYPE i VALUE 10.

    "Multiplicaciones
    DATA:   LV_PACKAGE_WEIGHT TYPE i VALUE 2,
			LV_COST_PER_KG TYPE i VALUE 3,
			LV_MULTI_RATE TYPE i.
			
    "Divisiones
    DATA:   LV_TOTAL_WEIGHT TYPE i VALUE 38,
            LV_NUM_PACKAGES TYPE i VALUE 4,
            LV_APPLIED_RATE TYPE p LENGTH 8 DECIMALS 2.

    "División sin resto
    DATA:   LV_TOTAL_COST TYPE i VALUE 17,
            LV_DISCOUNT_THRESHOLD TYPE i VALUE 4,
            LV_RESULT TYPE p LENGTH 4 DECIMALS 2.

    "Resto
    DATA:   LV_TOTAL_COST_MOD TYPE i VALUE 19,
            LV_DISCOUNT_THRESHOLD_MOD TYPE i VALUE 4,
            LV_REMAINDER TYPE p LENGTH 4 DECIMALS 2.

    "Exponenciacion / Raiz
    DATA:   LV_WEIGHT TYPE i VALUE 5,
            LV_EXPO TYPE i,
            LV_SQUARE_ROOT TYPE i.

    INTERFACES:  if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_arithmetic_vpuebla IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "SUMA / SENTENCIA ADD
    LV_TOTAL_RATE = LV_BASE_RATE + LV_CORP_AREA_RATE + LV_MEDICAL_SERVICE_RATE.
    out->write( | LV_TOTAL_RATE = { LV_TOTAL_RATE } | ).
    ADD 5 TO LV_TOTAL_RATE.
    out->write( | LV_TOTAL_RATE + 5 = { LV_TOTAL_RATE } | ).

    "Resta / Sentencia SUBTRACT
    LV_BASE_RATE = LV_MAINTENANCE_RATE - LV_MARGIN_RATE.
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } LV_BASE_RATE = { LV_BASE_RATE } | ).
    SUBTRACT 4 FROM LV_BASE_RATE.
    out->write( | LV_BASE_RATE - 4 = { LV_BASE_RATE } | ).

    "Multiplicación / Sentencia MULTIPLY
    LV_MULTI_RATE = LV_PACKAGE_WEIGHT * LV_COST_PER_KG.
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } LV_MULTI_RATE = { LV_MULTI_RATE } | ).
    MULTIPLY LV_MULTI_RATE BY 2.
    out->write( | LV_MULTI_RATE * 2 = { LV_MULTI_RATE } | ).

    "División / Sentencia DIVIDE
    LV_APPLIED_RATE = LV_TOTAL_WEIGHT / LV_NUM_PACKAGES.
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } LV_APPLIED_RATE = { LV_APPLIED_RATE } | ).
    DIVIDE LV_APPLIED_RATE BY 3.
    out->write( | LV_APPLIED_RATE / 3 = { LV_APPLIED_RATE } | ).

    "División sin resto / Sentencia DIV
    LV_RESULT = LV_TOTAL_COST DIV LV_DISCOUNT_THRESHOLD.
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } LV_RESULT = { LV_RESULT } | ).

    "Resto (residuo) de división / Sentencia MOD
    LV_REMAINDER = LV_TOTAL_COST_MOD MOD LV_DISCOUNT_THRESHOLD_MOD.
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } LV_REMAINDER = { LV_REMAINDER } | ).

    "Exponenciación
    LV_EXPO = LV_WEIGHT ** 2.
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } LV_EXPO = { LV_EXPO } | ).

    "Raiz cuadrada
    LV_SQUARE_ROOT = SQRT( LV_EXPO ).
    out->write( | { CL_ABAP_CHAR_UTILITIES=>NEWLINE } LV_SQUARE_ROOT = { LV_SQUARE_ROOT } | ).

  ENDMETHOD.

ENDCLASS.
