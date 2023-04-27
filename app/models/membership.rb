class Membership < ApplicationRecord
    
    validates_uniqueness_of :identifier, 
                            :name,
                            :position
    validates_presence_of   :identifier,
                            :name,
                            :position
    validates :cost, presence: true

    def price_in_cents
        (cost * 100).to_i
    end
end
