require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  test "Payment gets created" do
    date = DateTime.new(2001,2,3,4,5,6)
    payment = Payment.new
    payment.identifier = 0
    payment.card_id = 6
    payment.rental_id = 4
    payment.user_id = 3
    payment.purpose = "rental"
    payment.amount = 1
    payment.date = date

    assert payment.save
  end
  test "Payment can't have rental and membership" do
    date = DateTime.new(2001,2,3,4,5,6)
    payment = Payment.new
    payment.identifier = 0
    payment.card_id = 6
    payment.rental_id = 4
    payment.membership_id = 2
    payment.user_id = 3
    payment.purpose = "rental"
    payment.amount = 1
    payment.date = date

    assert_not payment.save
  end
end
