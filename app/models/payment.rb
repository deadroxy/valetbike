class Payment < ApplicationRecord
    validates_presence_of   :identifier,
                            :purpose,
                            :user_id,
                            :amount,
                            :card_id,
                            :date
    validates_uniqueness_of :identifier
    validates_inclusion_of :purpose, in: Array["rental", "membership"]
    validate :has_rental_or_membership
    validate :purpose_matches_association
    validates_numericality_of :amount, greater_than_or_equal_to: 0

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
    private
    # returns true if this payment belongs to either a membership or a rental but not both
    def has_rental_or_membership
        (rental_id.present? || membership_id.present?) && !(rental_id.present? && membership_id.present?)
    end
    def purpose_matches_association
        (rental_id.present? && purpose == "rental") || (membership_id.present? && purpose == "membership")
    end
end
