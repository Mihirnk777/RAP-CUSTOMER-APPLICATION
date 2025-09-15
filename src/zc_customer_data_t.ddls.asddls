@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CUSTOMER_DATA_T
provider contract transactional_query
as projection on ZR_CUSTOMER_DATA_t
{
    key CustomerUuid,
    Name,
    City,
    Country,
    Email,
    CreatedBy,
    LastChangedBy,
    CreatedAt,
    ChangedAt
}
