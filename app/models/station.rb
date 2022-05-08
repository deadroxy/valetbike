class Station < ApplicationRecord
	validates_presence_of    :identifier,
                           :name,
                           :address,
                           :total_docks
  	validates_uniqueness_of  :identifier
end
