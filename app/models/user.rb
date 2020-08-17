class User < ActiveRecord::Base
    has_many :subscriptions
    has_many :products, through: :subscriptions
    has_secure_password #won't be able to save user info to the database unless our user filled out the password field. Calling user.save will return false if the user can't be persisted. 



end