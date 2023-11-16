class Membership < ApplicationRecord
    has_many :users, class_name: :User, foreign_key: :membership_id
end
