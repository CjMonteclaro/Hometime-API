class GuestSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :phone, :email

  has_many :reservations, serializer: ReservationSerializer
end
