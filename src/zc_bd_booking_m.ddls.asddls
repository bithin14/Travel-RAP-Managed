@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Details'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_BD_BOOKING_M
  as projection on ZI_BD_Booking_M
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingStatusText,
      _BookingSuppliment : redirected to composition child ZC_BD_BOOKING_SUPPL_M,
      _Currency,
      _Connection,
      _Customer,
      _Travel            : redirected to parent ZC_BD_TRAVEL_M
}
