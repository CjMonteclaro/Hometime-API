class Guest < ApplicationRecord
    validates :email, uniqueness: true, presence: true

    has_many :reservations
end 
