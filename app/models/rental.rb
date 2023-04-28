class Rental < ApplicationRecord
  belongs_to :bike
  belongs_to :user


  # def length_of_ride 
  #   end_time - created_at 
  # end 

  # def cost 
  #   length_of_ride * .05 
  # end 

end
