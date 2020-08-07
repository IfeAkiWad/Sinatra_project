class SubscriptionsController < ApplicationController
    #index action (shows current user  ALL current subscriptions)
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
      # binding.pry
      @subscription = Subscription.find_by_id(params[:id])
      @cost = @subscription.subscripton_cost(frequency)#call the cost method on the subsciption
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
      #binding.pry
      current_product(params[:product_id])
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
   get "/subscriptions/:id/edit" do
      # make sure it is current_user product and subscription before sent to edit page
         @subscription = Subscription.find_by_id(params[:id])
         #binding.pry
         current_product(@subscription.product.id)
         if current_user && (current_user.id == @subscription.user.id)
            # binding.pry
             erb :'subscriptions/edit'
         end
   #   erb :'subscriptions/edit'
   end

   private
   def current_product(prod_id)
      #binding.pry
      @product = Product.find_by_id(prod_id)
   end
end