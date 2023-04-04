class Membership < ApplicationRecord
    #has_one :payment, class_name: :Payment, foreign_key: membership_id, optional: true
    
    validates_uniqueness_of :identifier, :position
    validates_presence_of   :identifier,
                            :name,
                            :position
end
