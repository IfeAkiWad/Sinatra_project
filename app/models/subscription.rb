require 'pry'
class Subscription < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

end