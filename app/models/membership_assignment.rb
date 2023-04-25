class MembershipAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :membership
  has_one :payment, class_name: :Payment, foreign_key: payment_id, optional: true
end
