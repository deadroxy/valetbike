class Membership < ApplicationRecord
    has_one :payment, class_name: :Payment, foreign_key: membership_id, optional: true
    validates_uniqueness_of :identifier
    validates_presence_of   :identifier,
                            :name,
                            :start
end
