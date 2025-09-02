@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BD_Booking_Suppl_M
  as select from /dmo/booksuppl_m
  association        to parent ZI_BD_Booking_M as _Booking  on  $projection.TravelId  = _Booking.TravelId
                                                            and $projection.BookingId = _Booking.BookingId
  association [0..1] to I_Currency             as _Currency on  $projection.CurrencyCode = _Currency.Currency
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      last_changed_at       as LastChangedAt,
      _Booking,
      _Currency
}
