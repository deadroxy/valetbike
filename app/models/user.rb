class User < ApplicationRecord

    validates :first_name, presence: true, length: { maximum: 20 }
    validates :last_name, presence: true, length: { maximum: 20 }
    validates :email, presence: true,
                      format: ,
                      length: { maximum: 50 },
                      uniqueness: true,
                      confirmation: true
    #validates :membership_id, presence: true
    #validates :user_id, presence: true
    #validates :card_id, presence: true


    def get_name
    end

    def get_email
    end

    def has_phone
        if !phone.empty?
            
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

