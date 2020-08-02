class Subscription < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

    # attributes: frequency

    def cost(frequency)
        if frequency == "bi-weekly" 
            cost = 5 
        elsif frequency == "monthly" 
            cost = 10 
        else 
            cost = 20 
        end
        cost
    end
end