class Rental < ApplicationRecord
    
    belongs_to :bike, class_name: :Bike, foreign_key: :bike_id, optional: false
    belongs_to :renter, class_name: :User, foreign_key: :renter_id, optional: false
    def is_ongoing?
        if end_time
            return False
        end
        True
    end
    def is_done?
        if end_time
            return True
        end
        False
    end
    def getTimeElapsed
        if self.is_done? 
            return end_time - start_time
        end
        Time.now - start_time
    end
    def getAverageSpeed
        if self.is_ongoing? || !distance
            return Nil
        end
        return distance / self.getTimeElapsed
    end
end
