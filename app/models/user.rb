class User < ApplicationRecord
  validates_presence_of    :Username,
                           :Email,
                           :Password,
                           :CreditCardNum,
                           :ExpDate,
                           :SecurityCode
  validates_uniqueness_of  :Username
  validates_uniqueness_of  :Email
  validates_format_of :Email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates_length_of :Username, :minimum => 4
  validates_length_of :Password, :minimum => 5
  validates_length_of :CreditCardNum, :is =>16
  validates_length_of :SecurityCode, :maximum => 4
  validates_format_of :ExpDate, :with =>  /\A\d{2}\/\d{2}\z/

end
