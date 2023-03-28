class Card < ApplicationRecord
    validates_presence_of    :identifier,
                             :card_holder_name,
                             :card_number,
                             :CVC,
                             :expiration_date,
                             :billing_address

    validates_uniqueness_of  :identifier

    belongs_to: user, class_name: :User, foreign_key: :user_id, optional: true
end
