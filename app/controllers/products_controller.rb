class ProductsController < ApplicationController
     #index action/read
  get '/products' do
    @products = Product.all
    erb :'products/index'
  end
  
  # DO I NEED THIS CODE?
  # #new action have to go about show action/create
  # get '/products/new' do
  #   @product = Product.create
  #   erb :'/products/new'
  # end
  #show action
  get '/products/:id' do
    # binding.pry
    @product = Product.find_by_id(params[:id])
    
    erb :'products/show'
  end

  # DO I NEED THIS CODE?
   # edit/update
  # get "products/:id/edit" do
  #   erb :'product/edit'
  # end

end