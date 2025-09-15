CLASS zcl_dta_upload_mnk DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dta_upload_mnk IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  MODIFY ENTITIES OF ZR_CUSTOMER_DATA_T
  ENTITY Customer
  CREATE AUTO FILL CID
  WITH VALUE #( ( Name = 'Mihir' %control-Name = if_abap_behv=>mk-on ) )
  MAPPED DATA(ls_mapped)
  REPORTED DATA(LS_REPORTED)
  FAILED DATA(LS_FAILED).
 IF LS_MAPPED-Customer IS NOT INITIAL.

 out->write( ls_mapped-customer[ 1 ]-CustomerUuid ).
 COMMIT ENTITIES RESPONSE  OF ZR_CUSTOMER_DATA_T
 FAILED DATA(LS_COMMIT_FAILED)
 REPORTED DATA(LS_COMMIT_REPORTED).

 if ls_commit_failed is INITIAL and ls_commit_reported is INITIAL.
 out->write( 'Data Got Inserted' ).
 ENDIF.
 endif.
 ENDMETHOD.
ENDCLASS.
