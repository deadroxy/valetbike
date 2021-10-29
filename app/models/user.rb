class User < ApplicationRecord
  validates_presence_of    :identifier,
                           :Email,
                           :Username,
                           :Password,
                           :CreditCardNum,
                           :ExpDate,
                           :SecurityCode
  validates_uniqueness_of  :identifier

end
