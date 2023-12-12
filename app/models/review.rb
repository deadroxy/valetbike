class Review < ApplicationRecord
  belongs_to :member
  belongs_to :route
end
