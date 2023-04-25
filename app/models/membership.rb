class Membership < ApplicationRecord
    
    validates_uniqueness_of :identifier, :position
    validates_presence_of   :identifier,
                            :name,
                            :position
    before_validation :set_default_position,
        if: Proc.new {|t| t.position.blank? || t.position < 0 }
    private
    def set_default_position
        max = Membership.maximum(:position) || 0
        self.position = max + 1
    end
end
