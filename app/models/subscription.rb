class Subscription < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

    # attributes: frequency

    def cost(frequency)
        if frequency == "bi-weekly" 
            cost = 5.00 
        elsif frequency == "monthly" 
            cost = 10.00
        else 
            cost = 20.00
        end
        cost
    end
end