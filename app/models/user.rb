class User < ActiveRecord::Base
    has_many :subscriptions
    has_many :products, through: :subscriptions
    has_secure_password



end