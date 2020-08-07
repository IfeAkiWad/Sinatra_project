require 'pry'
class Subscription < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

    # attributes: frequency

    # def subscription_cost(frequency)
    #     # binding.pry
    # # frequency = Subscription.all.find{|s|s.frequency.downcase == frequency}
    #     case frequency
    #     when "bi-weekly" 
    #         cost = 5.00 
    #     when "monthly" 
    #         cost =  10.00
    #     when "bi-monthly"
    #         cost =  20.00
    #     else
    #         "You have no subscription frequency"
    #     end
    #     # binding.pry
    # subscription_cost
    # end
end