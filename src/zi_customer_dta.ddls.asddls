@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view - customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CUSTOMER_DTA
  as select from zcustomer_rap
{
  key customer_uuid   as CustomerUuid,
      name            as Name,
      city            as City,
      country         as Country,
      email           as Email,
      created_by      as CreatedBy,
      last_changed_by as LastChangedBy,
      created_at      as CreatedAt,
      changed_at      as ChangedAt
}
