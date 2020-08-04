class ProductsController < ApplicationController
     #index action/read
  get '/products' do
    @products = Product.all
    erb :'products/index'
  end
  
  #show action (displays one article based on ID in the url)
  get '/products/:id' do
    # binding.pry
    @product = Product.find_by_id(params[:id])
    
    erb :'products/show'
  end
end