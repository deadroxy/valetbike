class Card < ApplicationRecord

    validates :cardholder_name, presence: true, length: { maximum: 50 }
    validates :card_number, presence: true, numericality: { only_integer: true }, length: { maximum: 16 }
    validates :cvv, presence: true, numericality: { only_integer: true }, length: { is: 3 }
    # validates :expiration_date, presence: true, format: { with: /\d{2}\/\d{2}/, message: 'must be in the format MM/YY' }

    # belongs_to :user, class_name: :User, foreign_key: :user_id, optional: true
    

  
end
