

class SubscriptionsController < ApplicationController
    #index action (shows current user  ALL current subscriptions)
   get '/subscriptions' do
      if logged_in?
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
      @product = Product.find_by_id(params[:product_id])
      erb :'subscriptions/new'
   end

   post '/subscriptions' do #Data from subscription form
      #because of the hidden field, params will now have a key/value pair called product_id
      @subscription = Subscription.new
      @subscription.user_id = current_user.id
      @subscription.product_id = params[:product_id]
      @subscription.frequency = params[:frequency]
         if @subscription.save
            redirect '/subscriptions'
         else
            redirect 'subscriptions/new'

         end
   end
   
   
   get "/subscriptions/:id/edit" do  #edit form
      # make sure it is current_user product and subscription before sent to edit page
         @subscription = Subscription.find_by_id(params[:id])
         if current_user && (current_user.id == @subscription.user.id)
             erb :'subscriptions/edit'
         else
            redirect '/subscriptions'
         end
   end

   patch '/subscriptions/:id' do #edit action
      # binding.pry
      @subscription = Subscription.find_by_id(params[:id])
      params.delete(:_method)
      @subscription.update(params)
      redirect "/subscriptions/#{@subscription.id}"
   end

   delete '/subscription/:id' do #delete action
      @subscription = Subscription.find_by_id(params[:id])
      @subscription.delete
      redirect to '/subscriptions'
    end

   # post "/subscriptions/:id" do 
   #    @subscription = Subscription.find_by_id(params[:id])
   # #    @subscription.user_id = current_user.id
   # #    @subscription.product_id = params[:product_id]
   #    @subscription.frequency = params[:frequency]
   # #    # current_product
   #    @subscription.save
   # #       # binding.pry
   #       redirect '/subscriptions/:id'
   #    # else
   # #       # binding.pry
   #       # redirect "/subscriptions/:id/edit"
   #    # end
   # # end

   # private
   # def current_product(prod_id)
   #    @product = Product.find_by_id(prod_id)
   # end
end