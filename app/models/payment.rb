class Payment < ApplicationRecord
  belongs_to :member
  belongs_to :ride
end
