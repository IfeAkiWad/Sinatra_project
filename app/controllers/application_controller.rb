require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
  end

  get "/" do
    erb :welcome
  end

  get '/registration/signup' do

    erb :'/registration/signup'
  
  end

  post "/registration" do
    puts params

    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect '/users/homepage'
  end

  get '/sessions/login' do

    erb :'sessions/login'
  end

  get 'users/homepage' do

    erb :'homepage'
  end
    

end
