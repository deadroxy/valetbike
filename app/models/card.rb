class Card < ApplicationRecord
    validates_presence_of       :identifier,
                                :cardholder_name,
                                :card_number,
                                :expiration_date;
                                :cvv
    validates_uniqueness_of     :identifier
  
end
