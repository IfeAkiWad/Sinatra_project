class SubscriptionsController < ApplicationController
   get '/subscriptions' do #index action (shows current user ALL current subscriptions)
      if logged_in?
         @subscriptions = current_user.subscriptions
         erb :'subscriptions/index'
      else
         redirect '/sessions/login'
      end
   end

   get '/subscriptions/:id' do #show action (shows current user's specific subscription)
      @subscription = Subscription.find_by_id(params[:id])
      if logged_in?
         erb :'subscriptions/show'
      else
         redirect '/sessions/login'
      end
   end

   get '/products/:product_id/subscriptions/new' do # subscription form
      @product = Product.find_by_id(params[:product_id])
      if logged_in?
      erb :'subscriptions/new'
      else
         redirect '/sessions/login'
      end
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
         if logged_in?
            erb :'subscriptions/edit'
            else
               redirect '/sessions/login'
            end
         if current_user && (current_user.id == @subscription.user.id)
             erb :'subscriptions/edit'
         else
            redirect '/subscriptions'
         end
   end

   patch '/subscriptions/:id' do #edit action
      # binding.pry
      if logged_in?
         @subscription = Subscription.find_by_id(params[:id])
         params.delete(:_method)
         @subscription.update(params)
         redirect "/subscriptions/#{@subscription.id}"
      else
         redirect '/sessions/login'
      end
   end

   delete '/subscription/:id' do #delete action
      @subscription = Subscription.find_by_id(params[:id])
      if logged_in?
         @subscription.delete
      else
         redirect '/sessions/login'
      end
      redirect to '/subscriptions'
    end
end