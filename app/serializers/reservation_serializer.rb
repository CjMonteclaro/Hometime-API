class ReservationSerializer < ActiveModel::Serializer
  attributes :code, :start_date, :end_date, :number_of_nights, :number_of_guests, :number_of_adults, :number_of_children, :number_of_infants, :status, :currency, :payout_price, :security_price, :total_price

  belongs_to :guest, serializer: GuestSerializer
end
