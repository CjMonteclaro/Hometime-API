class Reservation < ApplicationRecord
  validates :code, uniqueness: true, presence: true

  belongs_to :guest

  def self.airbnb_payload(response)

    Reservation.find_or_initialize_by(code: response['reservation_code']).update(
      start_date: response['start_date'],
      end_date: response['end_date'],
      number_of_nights: response['nights'],
      number_of_guests: response['guests'],
      number_of_adults: response['adults'],
      number_of_children: response['children'],
      number_of_infants: response['infants'],
      status: response['status'],
      currency: response['currency'],
      payout_price: response['payout_price'],
      security_price: response['security_price'],
      total_price: response['total_price'],
      guest_id: Guest.find_or_create_by(
        first_name: response['guest']['first_name'],
        last_name: response['guest']['last_name'],
        phone: response['guest']['phone'],
        email: response['guest']['email']
      ).id
    )

  end

  def self.booking_com_payload(response)

    Reservation.find_or_initialize_by(code: response['reservation']['code']).update(
      start_date: response['reservation']['start_date'],
      end_date: response['reservation']['end_date'],
      number_of_nights: response['reservation']['nights'],
      number_of_guests: response['reservation']['number_of_guests'],
      number_of_adults: response['reservation']['guest_details']['number_of_adults'],
      number_of_children: response['reservation']['guest_details']['number_of_children'],
      number_of_infants: response['reservation']['guest_details']['number_of_infants'],
      status: response['reservation']['status_type'],
      currency: response['reservation']['host_currency'],
      payout_price: response['reservation']['expected_payout_amount'],
      security_price: response['reservation']['listing_security_price_accurate'],
      total_price: response['reservation']['total_paid_amount_accurate'],
      guest_id: Guest.find_or_create_by(
        first_name: response['reservation']['guest_first_name'],
        last_name: response['reservation']['guest_last_name'],
        phone: response['reservation']['guest_phone_numbers'][0],
        email: response['reservation']['guest_email']
      ).id
    )

  end
end
