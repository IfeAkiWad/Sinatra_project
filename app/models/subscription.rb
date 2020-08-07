require 'pry'
class Subscription < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

    # attributes: frequency

    def subscription_cost(frequency)
        # binding.pry
    # frequency = Subscription.all.find{|s|s.frequency.downcase == frequency}
        if frequency == "bi-weekly" 
            cost = 5.00 
        elsif frequency == "monthly" 
            cost =  10.00
        elsif frequency == "bi-monthly"
            cost =  20.00
        end
        # binding.pry
    subscription_cost
    end
end