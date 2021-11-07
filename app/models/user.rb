class User < ApplicationRecord
    has_secure_password
    validates :userName, uniqueness: true
end