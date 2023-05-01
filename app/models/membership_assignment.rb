class MembershipAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :membership
  has_one :payment, class_name: :Payment, foreign_key: :membership_id
  validates_presence_of :start
  after_validation :add_end
  scope :nil_end, -> {where(end: nil)}
  scope :end_before, -> (end_time) {where("end > ?", end_time)}
  scope :un_expired, -> (now = Time.now) {nil_end.or(end_before(now)).order(created_at: :desc)}

  private
  def add_end
    membership = Membership.find(membership_id)
    if membership.cost == 0
      return
    end
    time_unit = membership.time_unit
    frequency = membership.payment_frequency
    if time_unit == "month" || time_unit == "months" 
      self.end = start + frequency.month
    elsif time_unit == "year" || time_unit == "years"
      self.end = start + frequency.year
    elsif time_unit == "minute" || time_unit == "minutes"
      self.end = start + frequency.minute
    elsif time_unit == "day" || time_unit == "days"
      self.end = start + frequency.day
    elsif time_unit == "hour" || time_unit == "hours"
      self.end = start + frequency.hour
    else
      self.end = start + frequency
    end
  end
  def end_to_string
    if self.membership.cost == 0
      "the end of eternity"
    else
      self.end.strftime("%B %-d, %Y at %I:%M %P")
    end
  end
  def is_expired?
    if self.membership.cost == 0
      return false
    end
    self.end > Time.now
  end
end
# MembershipAssignment.where(end: nil).or(MemberhsipAssignment.where.not("end > ?", Time.now)).order(created_at: :desc)