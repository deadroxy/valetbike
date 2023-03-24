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
        unless rental_id.present? || membership_id.present?
            errors.add(:rental_id, "must be present if membership id is not")
            errors.add(:membership_id, "must be present if rental id is not")
        end
        if rental_id.present? && membership_id.present?
            errors.add(:rental_id, "cannot be present if payment has membership id")
            errors.add(:membership_id, "cannot be present if payment has rental id")
        end
    end
    def purpose_matches_association
        if rental_id.present?
            unless purpose == "rental"
                errors.add(:purpose, "must be rental if rental_id is present")
            end
        end 
        if membership_id.present?
            unless purpose == "membership"
                errors.add(:purpose, "must be membership if membership_id is present")
            end
        end
    end
end
