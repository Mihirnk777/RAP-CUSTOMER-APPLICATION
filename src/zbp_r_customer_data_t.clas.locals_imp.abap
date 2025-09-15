CLASS lhc_Customer DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Customer RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Customer RESULT result.
    METHODS valCreate FOR VALIDATE ON SAVE
      IMPORTING keys FOR Customer~valCreate.

ENDCLASS.

CLASS lhc_Customer IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD valCreate.

  Read entities of ZR_CUSTOMER_DATA_T IN LOCAL MODE
  ENTITY Customer
  fields ( NAME COUNTRY EMAIL )
  WITH CORRESPONDING #( KEYS )
  RESULT DATA(LS_RESULT)
  REPORTED DATA(LS_REPORTED)
  FAILED DATA(LS_FAILED).

  IF REPORTED-CUSTOMER IS NOT INITIAL OR FAILED-CUSTOMER IS NOT INITIAL.

  REPORTED = CORRESPONDING #( DEEP LS_REPORTED ).
  FAILED = CORRESPONDING #( DEEP LS_FAILED ).
  ELSE.
  LOOP AT LS_RESULT INTO DATA(RESULT_ROW).
  IF RESULT_ROW-Name is  INITIAL.
  failed-customer = value #(  base failed-customer (  %tky = result_row-%tky ) ).
  reported-customer = value #( base reported-customer
                              ( %tky = result_row-%tky
                                 %msg = new_message_with_text(  text = 'Name is missing' ) ) ).
                               endif.
  IF RESULT_ROW-Country is  INITIAL.
  failed-customer = value #(  base failed-customer (  %tky = result_row-%tky ) ).
  reported-customer = value #( base reported-customer
                              ( %tky = result_row-%tky
                                 %msg = new_message_with_text(  text = 'Country is missing' ) ) ).
                               endif.
 IF RESULT_ROW-Email is  INITIAL.
  failed-customer = value #(  base failed-customer (  %tky = result_row-%tky ) ).
  reported-customer = value #( base reported-customer
                              ( %tky = result_row-%tky
                                 %msg = new_message_with_text(  text = 'Email is missing' ) ) ).
                               endif.


  ENDLOOP.
  ENDIF.

ENDMETHOD.

ENDCLASS.
