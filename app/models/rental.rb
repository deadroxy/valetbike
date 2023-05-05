class Rental < ApplicationRecord
  belongs_to :bike
  belongs_to :user



  def length_of_ride 
    Time.now - created_at
    
  end 


  before_update :pay

  def cost 
    # puts ((length_of_ride.to_int)/60)/60* 1
    # puts length_of_ride.to_int
    # length_of_ride.to_int
    #this below is the code to recmmment int
    puts length_of_ride.to_int
    ((length_of_ride.to_int)/60) 

  end 

  def pay
      ## if enough credits to pay:
      u = user.credit 

      user.update_attribute(:credit, u - cost)
      # else 
        #option to add more credits 
      #end 
      

  end

  


end
