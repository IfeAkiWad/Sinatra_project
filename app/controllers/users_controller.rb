class UsersController < ApplicationController
get '/registrations/signup' do

    erb :'/registrations/signup'
  
  end

  post '/registrations' do
    puts params

    @user = User.new(name: params["name"], email: params["email"], username: params["username"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect '/users/homepage'
  end

  get '/sessions/login' do

    erb :'/sessions/login'
  end
  
  post '/sessions' do 
    puts params
    user = User.find_by(:username => params[:username])
 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/homepage"
    else
      redirect "/sessions/login"
    end
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

  get '/users/homepage' do
    @user = User.find(session[:user_id])
    erb :'/users/homepage'
  end
end