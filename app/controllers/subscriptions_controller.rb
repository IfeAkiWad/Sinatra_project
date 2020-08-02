class SubscriptionsController < ApplicationController
    #index action
   get '/subscriptions' do
      # binding.pry
      if logged_in?
         @subscriptions = current_user.subscriptions
         erb :'subscriptions/index'
      else
         redirect '/sessions/login'
      end
   end

   # subscription form
   get '/products/:product_id/subscriptions/new' do 
      binding.pry
      @product = Product.find_by_id(params[:product_id])
      erb :'subscriptions/new'
   end

   post '/subscriptions' do
      binding.pry
    #because of the hidden field, params will now have a key/value pair called product_id
    #calling current_user.subscriptions.create(params) will the associate that new subscription with that product and user
      @subscription = current_user.subscriptions.create(params)
         # create if/case statement to determine cost by frequency
   end
   # edit/update
   get "/products/:product_id/subscriptions/edit" do
      # make sure it is current_user product and subscription before sent to edit page
     erb :'product/edit'
   end


end