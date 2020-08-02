class ProductsController < ApplicationController
     #index action/read
  get '/products' do
    @products = Product.all
    erb :'products/index'
  end
  
  #show action
  get '/products/:id' do
    # binding.pry
    @product = Product.find_by_id(params[:id])
    
    erb :'products/show'
  end
end