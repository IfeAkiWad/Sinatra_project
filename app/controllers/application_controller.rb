require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
  end

  get '/' do
    erb :welcome
  end

  get '/registration/signup' do

    erb :'/registration/signup'
  
  end

  post '/registration' do
    puts params

    @user = User.new(name: params["name"], email: params["email"], username: params["username"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect to '/users/homepage'
  end

  get '/sessions/login' do

    erb :'/sessions/login'
  end
  
  post '/sessions' do 
    puts params
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to '/users/homepage'
    end
    redirect to '/sessions/login'
  end

  get '/users/homepage' do
    @user = User.find(session[:user_id])
    erb :'/users/homepage'
  end
end
