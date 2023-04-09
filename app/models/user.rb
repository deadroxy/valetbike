class User < ApplicationRecord
    # validates_presence_of    :identifier,
    #                          :name,
    #                          :address
    # validates_uniqueness_of  :identifier
    
    has_many :renting_processes
    
  end