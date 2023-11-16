class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    belongs_to :membership, class_name: :Membership, foreign_key: :membership_id, optional: true
    
    has_many :trips, class_name: :Trip, foreign_key: :user_id

end
