class ProductsController < ApplicationController
     #index action
  get '/products' do
    @products = Product.all
    erb :'products/index'
  end
  #new action have to go about show action!

  #show action 
  get '/products/:id' do
    @product = Product.find_by_id(params[:id])
    
  end

end