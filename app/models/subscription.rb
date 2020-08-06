require 'pry'
class Subscription < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

    # attributes: frequency

    def cost(frequency)
        
        if frequency
            binding.pry
            if frequency.downcase == "bi-weekly" 
                return  5.00 
            elsif frequency.downcase == "monthly" 
                return 10.00
             else 
                return 20.00
            end
        end
        
    end
end