class SubscriptionsController < ApplicationController
    #index action
   get '/subscriptions' do
      # binding.pry
      if logged_in?
         # binding.pry
         @subscriptions = current_user.subscriptions
         erb :'subscriptions/index'
      else
         redirect '/sessions/login'
      end
   end

   # subscription form
   get '/products/:product_id/subscriptions/new' do 
      # binding.pry
      @product = Product.find_by_id(params[:product_id])
      erb :'subscriptions/new'
   end

   post '/subscriptions' do #NOT WORKING: WEIRD ERROR
      # binding.pry
    #because of the hidden field, params will now have a key/value pair called product_id
      @subscription = Subscription.new
      @subscription.user_id = current_user.id
      @subscription.product_id = params[:product_id]
         if @subscription.save
            @subscription.cost(@subscription.frequency)
            redirect 'subscriptions/index'
         else
            redirect 'subscriptions/new'
         end
   end
   
   # edit/update
   get "/products/:product_id/subscriptions/edit" do
      # make sure it is current_user product and subscription before sent to edit page
     erb :'product/edit'
   end


end