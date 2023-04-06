class Card < ApplicationRecord
    validates_presence_of       :cardholder_name,
                                :card_number,
                                :expiration_date,
                                :cvv,
                                :card_balance

    # belongs_to :user, class_name: :User, foreign_key: :user_id, optional: true
  
end
