class Payment < ApplicationRecord

    # need reference to user who is paying...
    # attributes: (include ref above)
    # status
    # amount
    enum status: { pending: 0, succeeded: 1, failed: 2 }
    # need to get Money gem
    monetize :amount
    # payment options?

    belongs_to :user # user or users?

    validates_presence_of   :user,
                            :status,
                            :amount

    validates_numericality_of   :amount      # this should work or else there's different ways of writing this

    # has many payment options?


    # methods
    def process_payment
        # use payment API to create payment and process payment
        # set the payment status based on the result of the payment process
     end


end
p