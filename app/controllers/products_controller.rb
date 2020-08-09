class ProductsController < ApplicationController
  get '/products' do #index action
    @products = Product.all
    erb :'products/index'
  end
  
  get '/products/:id' do #show action 
    # binding.pry
    @product = Product.find_by_id(params[:id])
    erb :'products/show'
  end
end