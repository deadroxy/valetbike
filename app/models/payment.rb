class Payment < ApplicationRecord
    validates_presence_of   :identifier,
                            :purpose,
                            :user_id,
                            :amount,
                            :card_id,
                            :date
    validates_uniqueness_of :identifier
    # belongs_to :card, class_name: :Card, foreign_key: :card_id
    # belongs_to :user, class_name: :User, foreign_key: :user_id
    # belongs_to :rental, class_name: :Rental, foreign_key: rental_id, optional: true
    # belongs_to :membership, class_name: :Membership, foreign_key: membership_id, optional: true
    
    # returns the purpose
    def getPurpose
        @purpose
    end
    # def getUser
    #     @purpose
    # end
end
