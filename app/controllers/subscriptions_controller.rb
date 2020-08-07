

class SubscriptionsController < ApplicationController
    #index action (shows current user  ALL current subscriptions)
   get '/subscriptions' do
      if logged_in?
         @subscriptions = current_user.subscriptions
         # @product = Product.find_by_id(params[:id])
         # binding.pry
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

   post '/subscriptions' do 
      # current_product(params[:product_id])
      # binding.pry
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
   
   # edit/update
   get "/subscriptions/:id/edit" do
      # make sure it is current_user product and subscription before sent to edit page
         @subscription = Subscription.find_by_id(params[:id])
         # current_product(prod_id) #= Product.find_by_id(params[:id])
         if current_user && (current_user.id == @subscription.user.id)
             erb :'subscriptions/edit'
         else
            redirect '/sessions/login'
         end
   #   erb :'subscriptions/edit'
   end

   # patch '/subscriptions/:id' do #edit action
   #    @subscription = Subscription.find_by_id(params[:id])
   #    @subscription.user_id = current_user.id
   #    @subscription.product_id = params[:product_id]
   #    @subscription.frequency = params[:frequency]
   #    # @article = Article.find_by_id(params[:id])
   #    # @article.title = params[:title]
   #    # @article.content = params[:content]
   #    @subscription.save
   #    redirect "/subscriptions/:id"
   # end

   # post "/subscriptions/:id" do 
   #    @subscription = Subscription.find_by_id(params[:id])
   #    @subscription.user_id = current_user.id
   #    @subscription.product_id = params[:product_id]
   #    @subscription.frequency = params[:frequency]
   #    # current_product
   #    if @subscription.save
   #       # binding.pry
   #       redirect '/subscriptions/:id'
   #    else
   #       # binding.pry
   #       redirect "/subscriptions/:id/edit"
   #    end
   # end

   # private
   # def current_product(prod_id)
   #    @product = Product.find_by_id(prod_id)
   # end
end