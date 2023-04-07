class Membership < ApplicationRecord
    
    validates_uniqueness_of :identifier, :position
    validates_presence_of   :identifier,
                            :name,
                            :position
end
