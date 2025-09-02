@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Details'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_BD_TRAVEL_M
  provider contract transactional_query
  as projection on ZI_BD_Travel_M
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      //      CreatedBy,
      //      CreatedAt,
      //      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_BD_BOOKING_M,
      _Currency,
      _Customer,
      _OverallStatus,
      _OverallStatusText
}
