class SubscriptionsController < ApplicationController
    #index action
   get '/subscriptions' do
      if logged_in?
         @subscriptions = current_user.subscriptions
         erb :'subscriptions/index'
      else
         redirect '/sessions/login'
      end
   end

   get '/products/:product_id/subscriptions/new' do 
      @product = Product.find_by_id(params[:product_id])
      erb :'subscriptions/new'
   end

   post '/subscriptions' do
    #because of the hidden field, params will now have a key/value pair called product_id
    #calling current_user.subscriptions.create(params) will the associate that new subscription with that product and user
      @subscription = current_user.subscriptions.create(params)
   end

end