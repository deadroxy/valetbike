class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

    validates :first_name, presence: true, length: { maximum: 20 }
    validates :last_name, presence: true, length: { maximum: 20 }
    validates :email, presence: true,
                      format: { with: EMAIL_REGEX },
                      length: { maximum: 50 },
                      uniqueness: true,
                      confirmation: true
    validates :membership_id, presence: true
    #validates :user_id, presence: true
    #validates :card_id, presence: true
    has_many :rentals, class_name: :Rental, foreign_key: :renter_id
    has_many :payments, class_name: :Payment, foreign_key: :user_id
    has_many :membership_assignments, class_name: :MembershipAssignment, foreign_key: :user_id
    has_many :memberships, through: :membership_assignments

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

    
end

