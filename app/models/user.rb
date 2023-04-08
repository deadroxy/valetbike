class User < ApplicationRecord

    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

    validates :first_name, presence: true, length: { maximum: 20 }
    validates :last_name, presence: true, length: { maximum: 20 }
    validates :email, presence: true,
                      format: { with: EMAIL_REGEX },
                      length: { maximum: 50 },
                      uniqueness: true,
                      confirmation: true
    #validates :membership_id, presence: true
    #validates :user_id, presence: true
    #validates :card_id, presence: true
    validates :phone, optional: true, 
                      format: { with: /\A[0-9]{10}\z/, 
                      message: "Please enter a valid 10-digit phone number" }


    def get_name

    end

    def get_email
    end

    def has_phone        
    end

    def get_phone
    end

    def is_admin
    end

    def has_payment_info
    end


    #(* reference: belows are from the Ruby Training *)#
    def full_name
        [first_name, last_name].join(' ')
    end

    def last_name_first
        [last_name, first_name].join(', ')
    end

    def abbrev_name
        first_initial = first_name.chars.first + ", "
        [first_initial, last_name].join(' ')
    end

    has_many: payments
    #has_many: rentals
end

