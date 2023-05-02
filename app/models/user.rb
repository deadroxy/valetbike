class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a validate email address" }

    validates :password, presence: true, length: { in: 6..20 }

    validates :username, presence: true

    validates :phone_num, presence: true, length: { in: 6..20 }

    validates_uniqueness_of :email

    validates_uniqueness_of :phone_num
end
