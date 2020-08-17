class SubscriptionsController < ApplicationController
   get '/subscriptions' do #index action (shows current user ALL current subscriptions)
      redirect_if_not_logged_in
      @subscriptions = current_user.subscriptions
      erb :'subscriptions/index'
   end

   get '/subscriptions/:id' do #show action (shows current user's specific subscription)
      @subscription = Subscription.find_by_id(params[:id])
      redirect_if_not_logged_in
         erb :'subscriptions/show'
   end

   get '/products/:product_id/subscriptions/new' do # subscription form
      @product = Product.find_by_id(params[:product_id])
      redirect_if_not_logged_in
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
      redirect_if_not_logged_in
      erb :'subscriptions/edit'
         if current_user && (current_user.id == @subscription.user.id)
             erb :'subscriptions/edit'
         else
            redirect '/subscriptions'
         end
   end

   patch '/subscriptions/:id' do #edit action
      # binding.pry
      redirect_if_not_logged_in
      @subscription = Subscription.find_by_id(params[:id])
      params.delete(:_method) #deleting _method so i can use entire params
         if current_user && (current_user.id == @subscription.user.id)
            @subscription.update(params)
         end
         redirect "/subscriptions/#{@subscription.id}"
   end

   delete '/subscription/:id' do #delete action
      @subscription = Subscription.find_by_id(params[:id])
      redirect_if_not_logged_in
         if current_user && (current_user.id == @subscription.user.id)
            @subscription.delete
         end
      redirect to '/subscriptions'
    end
end