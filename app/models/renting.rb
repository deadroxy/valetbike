class Renting < ApplicationRecord
    scope :completed, -> { where(status: true) }

    scope :incompleted, -> { where(status: false)}
    
    scope :sorted, -> {order(:created_at)}

    
    

    belongs_to :user, class_name: :User, foreign_key: :user_id
    has_and_belongs_to_many :stations
    

    def rentCode
        Random.rand(1111...9999)
    end

    def returnCode
        Random.rand(1111...9999)
    end


end
