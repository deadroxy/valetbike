class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # validates_presence_of :identifier, :name, :address
  # validates_uniqueness_of :identifier
  
  has_many :rentings, class_name: :Renting, foreign_key: :renting_id
  has_many :cards
end
