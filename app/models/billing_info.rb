class BillingInfo < ApplicationRecord
  belongs_to :Login

    validates :card_first_name, presence: true, length: { maximum: 20 }
    validates :card_last_name, presence: true, length: { maximum: 20 }
    validates :street_address, presence: true, length: { maximum: 100 }
    validates :city, presence: true, length: { maximum: 50 }
    validates :state_province, presence: true, length: { maximum: 50 }
    validates :zip_code, presence: true, length: { maximum: 20 }
    validates :country, presence: true


end
