class User < ApplicationRecord
  validates_presence_of    :username,
                           :email,
                           :password,
                           :creditCardNum,
                           :expDate,
                           :securityCode
  validates_uniqueness_of  :username
  validates_uniqueness_of  :email
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates_length_of :username, :minimum => 4
  validates_length_of :password, :minimum => 5
  validates_length_of :creditCardNum, :is =>16
  validates_length_of :securityCode, :maximum => 4
  validates_format_of :expDate, :with =>  /\A\d{2}\/\d{2}\z/
end
