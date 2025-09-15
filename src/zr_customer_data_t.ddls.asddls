@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Restricted Reuse view- customer'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_CUSTOMER_DATA_t as select from ZI_CUSTOMER_DTA
{
    key CustomerUuid,
    Name,
    City,
    Country,
    Email,
    @Semantics.user.createdBy: true 
    CreatedBy,
    @Semantics.user.localInstanceLastChangedBy: true
    LastChangedBy,
    @Semantics.systemDateTime.createdAt: true 
    CreatedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    ChangedAt
}

