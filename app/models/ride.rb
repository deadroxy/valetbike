class Ride < ApplicationRecord
  validates_presence_of    :identifier,
                           :Difficulty,
                           :Length,
                           :Description
  validates_uniqueness_of  :identifier

  has_many :station

end
