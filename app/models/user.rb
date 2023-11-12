class User < ApplicationRecord
    belongs_to :membership, class_name: :Membership, foreign_key: :membership_id, optional: true
    
    has_many :trips, class_name: :Trip, foreign_key: :user_id
end
