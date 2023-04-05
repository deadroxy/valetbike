class MembershipAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :membership
  has_one :payment, class_name: :Payment, foreign_key: membership_id, optional: true
end
