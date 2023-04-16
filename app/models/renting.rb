class Renting < ApplicationRecord
    scope :completed, -> { where(status: true) }
    scope :sorted, -> {order(:identifier)}


    # belongs_to :user, class_name: :User, foreign_key: :user_id, optional: true
    has_and_belongs_to_many :stations
    has_many :cards 
    

    def rentCode
        Random.rand(1111...9999)
    end

    def returnCode
        Random.rand(1111...9999)
    end


end
