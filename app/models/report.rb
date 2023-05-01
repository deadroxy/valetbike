class Report < ApplicationRecord
    validates :description, presence: true 
    attr_accessor :description
end
