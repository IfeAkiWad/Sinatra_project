class SubscriptionsController < ApplicationController
    #index action (shows current user current subscriptions)
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

   #show action (shows current user specific subscription)
   get '/subscriptions/:id' do 
      @subscription = Subscription.find_by_id(params[:id])
      if logged_in?
         erb :'subscriptions/show'
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

   post '/subscriptions' do 
      # binding.pry
    #because of the hidden field, params will now have a key/value pair called product_id
      @subscription = Subscription.new
      @subscription.user_id = current_user.id
      @subscription.product_id = params[:product_id]
      # binding.pry
         if @subscription.save
            @subscription.cost(@subscription.frequency)
            # binding.pry
            redirect '/subscriptions'
         else
            # binding.pry
            redirect 'subscriptions/new'

         end
   end
   
   # edit/update
   get "/products/:product_id/subscriptions/edit" do
      # make sure it is current_user product and subscription before sent to edit page
     erb :'product/edit'
   end


end