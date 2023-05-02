class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a validate email address" }, on: :create

    validates :password, presence: true, length: { in: 6..20 }, on: :create

    validates :username, presence: true, on: :create

    validates :phone_num, presence: true, length: { in: 6..20 }, on: :create

    validates_uniqueness_of :email, on: :create
 
    validates_uniqueness_of :phone_num, on: :create 
end
