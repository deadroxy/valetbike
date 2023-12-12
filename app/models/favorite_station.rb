class FavoriteStation < ApplicationRecord
  belongs_to :member
  belongs_to :station
end
