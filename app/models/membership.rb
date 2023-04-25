class Membership < ApplicationRecord
    
    validates_uniqueness_of :identifier, 
                            :name,
                            :position
    validates_presence_of   :identifier,
                            :name,
                            :position
    validates :cost, presence: true

    def price
        cost
    end
end
