class User < ApplicationRecord
  include Pay::Billable
  # include Pay::Customer

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def time_fmt
    str = created_at.strftime("%m/%d/%Y")
  end

  pay_customer

  # pay_customer stripe_attributes: :stripe_attributes
  # # Or using a lambda:
  # # pay_customer stripe_attributes: ->(pay_customer) { metadata: { { user_id: pay_customer.owner_id } } }

  # def stripe_attributes(pay_customer)
  #   {
  #     address: {
  #       city: pay_customer.owner.city,
  #       country: pay_customer.owner.country
  #     },
  #     metadata: {
  #       pay_customer_id: pay_customer.id,
  #       user_id: id # or pay_customer.owner_id
  #     }
  #   }
  # end

end
